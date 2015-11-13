//
//  URUserRegisterViewController.swift
//  ureport
//
//  Created by Daniel Amaral on 07/07/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit
import Firebase

class URUserRegisterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var viewNick: UIView!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewBirthDay: UIView!
    @IBOutlet weak var viewCountry: UIView!
    @IBOutlet weak var viewGender: UIView!
    @IBOutlet weak var btNext: UIButton!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtNick: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtBirthDay: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtGender: UITextField!
    @IBOutlet weak var txtState: UITextField!
    
    var color:UIColor?
    
    var pickerGender:UIPickerView?
    var pickerDate:UIDatePicker?
    var pickerCities:UIPickerView?
    
    var country:URCountry?
    var birthDay:NSDate?
    var gender:URGender?
    let genders:[String]? = [NSLocalizedString("male",comment:""),NSLocalizedString("female",comment:"")]
    let countries:[URCountry]? = URCountry.getCountries() as? [URCountry]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController! .setNavigationBarHidden(false, animated: false)
        
        setupUI()
        checkUserCountry()
    }
    
    
    init(color:UIColor) {
        self.color = color
        super.init(nibName: "URUserRegisterViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Button Events
    
    @IBAction func btNextTapped(sender: AnyObject) {
        
        if let textField = self.view.findTextFieldEmptyInView(self.view) {
            UIAlertView(title: nil, message: "The field \(textField.placeholder!) is empty", delegate: self, cancelButtonTitle: "OK").show()
        }else{
            
            var user:URUser = URUser()
            
            user.nickname = self.txtNick.text
            user.email = self.txtEmail.text
            user.gender = gender
//            user.birthday = self.birthDay
            user.country = country?.code
            user.state = self.txtState.text
            ProgressHUD.show(nil)
            URFireBaseManager.sharedInstance().createUser(user.email, password: self.txtPassword.text,
                withValueCompletionBlock: { error, result in
            ProgressHUD.dismiss()
                    if error != nil {
//                        UIAlertView(title: nil, message: "The field \(textField.placeholder!) is empty", delegate: self, cancelButtonTitle: "OK").show()
                    } else {
                        let uid = result["uid"] as? String
                        user.key = uid
                        
                        ProgressHUD.show(nil)
                        URFireBaseManager.sharedInstance().childByAppendingPath(URUser.path()).childByAppendingPath(user.key).setValue(user.asJson())
                        ProgressHUD.dismiss()
                        
                        if (error != nil) {
                            print(error)
                        }
                        
                        URUser.login(user.email!,password: self.txtPassword.text!, completion: { (FAuthenticationError,success) -> Void in
                            if success {
                                self.navigationController!.pushViewController(URMainViewController(nibName: "URMainViewController", bundle: nil), animated: true)
                            }else {
                                print("usuario nao encontrado")
                            }
                        })
                        
                        print("Successfully created user account with uid: \(uid)")
                    }
            })
            
            
        }
        
    }
    
    //MARK: Class Methods   
    
    private func checkUserCountry() {
        self.country = URCountry.getCurrentURCountry()        
        self.txtCountry.text = self.country?.name
    }
    
    private func setupUI() {
        
        self.navigationController?.navigationBar.barTintColor = self.color
        self.btNext.backgroundColor = self.color
        
        self.pickerDate = UIDatePicker()
        self.pickerGender = UIPickerView()
        self.pickerCities = UIPickerView()
        
        self.pickerDate!.datePickerMode = UIDatePickerMode.Date
        self.pickerDate!.addTarget(self, action: Selector("dateChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        self.txtBirthDay.inputView = self.pickerDate!
        
        self.pickerGender!.dataSource = self
        self.pickerGender!.delegate = self
        self.pickerGender!.showsSelectionIndicator = true
        self.txtGender.inputView = self.pickerGender
        
        self.pickerCities!.dataSource = self
        self.pickerCities!.delegate = self
        self.pickerCities!.showsSelectionIndicator = true
        self.txtCountry.inputView = self.pickerCities
        
    }
    
    func dateChanged(sender:AnyObject) {
        let datePicker:UIDatePicker? = sender as? UIDatePicker
        self.birthDay = datePicker!.date
        self.txtBirthDay.text = URDateUtil.brithDayFormatter(self.birthDay!)
    }
    
    //MARK: TextFieldDelegate
    
    func textFieldDidBeginEditing(textField: UITextField) {

    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if textField == self.txtBirthDay || textField == self.txtGender || textField == self.txtCountry{
            return false
        }else{
            return true
        }
    }
    
    //MARK: Picker DataSource and Delegate
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == self.pickerCities {
            return URCountry.getCountries().count
        }else if pickerView == self.pickerGender {
            return self.genders!.count
        }else {
            return 0
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if pickerView == self.pickerCities {
            return self.countries![row].name
        }else if pickerView == self.pickerGender {
            return self.genders![row]
        }else {
            return ""
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == self.pickerCities {
            country = (URCountry.getCountries()[row] as! URCountry)
            self.txtCountry.text = country!.name
        }else if pickerView == self.pickerGender {
            if row == 0 {
                gender = .Male
            }else {
                gender = .Female
            }
            self.txtGender.text = self.genders![row]
        }
    }
    
}

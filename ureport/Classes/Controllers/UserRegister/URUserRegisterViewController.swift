//
//  URUserRegisterViewController.swift
//  ureport
//
//  Created by Daniel Amaral on 07/07/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

class URUserRegisterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

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
    
    var pickerGender:UIPickerView?
    var pickerDate:UIDatePicker?
    var pickerCities:UIPickerView?
    
    var birthDay:NSDate?
    
    let genders:[String]? = ["Male","Female"]
    let countries:[URCountry]? = URCountry.getCountries() as? [URCountry]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController! .setNavigationBarHidden(false, animated: false)

        setupUI()
        setupTextFieldView()
    }
    
    
    //MARK: Button Events
    
    @IBAction func btNextTapped(sender: AnyObject) {
        
    }
    
    //MARK: Class Methods
    
    private func setupUI() {
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
    
    private func loadCities() {
        
        for (index,country) in enumerate(URCountry.getCountries() as! [URCountry]){
            println("index: \(country.code!) objeto: \(country.name!)")
        }
    }
    
    func dateChanged(sender:AnyObject) {
        var datePicker:UIDatePicker? = sender as? UIDatePicker
        self.birthDay = datePicker!.date
        self.txtBirthDay.text = URDateUtil.brithDayFormatter(self.birthDay!)
    }
    
    private func setupTextFieldView() {
        self.viewPassword.layer.borderWidth = 1
        self.viewNick.layer.borderWidth = 1
        self.viewEmail.layer.borderWidth = 1
        self.viewBirthDay.layer.borderWidth = 1
        self.viewCountry.layer.borderWidth = 1
        self.viewGender.layer.borderWidth = 1
        
        self.viewPassword.layer.borderColor = UIColor.grayColor().CGColor
        self.viewNick.layer.borderColor = UIColor.grayColor().CGColor
        self.viewEmail.layer.borderColor = UIColor.grayColor().CGColor
        self.viewBirthDay.layer.borderColor = UIColor.grayColor().CGColor
        self.viewCountry.layer.borderColor = UIColor.grayColor().CGColor
        self.viewGender.layer.borderColor = UIColor.grayColor().CGColor
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
            return URCountry.getCountries().count()
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
            self.txtCountry.text = (URCountry.getCountries()[row] as! URCountry).name!
        }else if pickerView == self.pickerGender {
            self.txtGender.text = self.genders![row]
        }
    }
    
}

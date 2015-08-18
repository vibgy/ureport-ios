//
//  URLoginCredentialsViewController.swift
//  ureport
//
//  Created by Daniel Amaral on 13/07/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

class URLoginCredentialsViewController: UIViewController {

    @IBOutlet weak var btForgotPassword: UIButton!
    @IBOutlet weak var btLogin: UIButton!
    @IBOutlet weak var txtLogin: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var viewLogin: UIView!
    @IBOutlet weak var viewPassword: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    //MARK: Button Events
    @IBAction func btForgotPasswordTapped(sender: AnyObject) {
        self.navigationController?.pushViewController(URForgotPasswordViewController(nibName:"URForgotPasswordViewController",bundle:nil), animated: true)
    }

    @IBAction func btLoginTapped(sender: AnyObject) {
        
        if let textfield = self.view.findTextFieldEmptyInView(self.view) {
            UIAlertView(title: nil, message: "\(textfield.placeholder!) is empty", delegate: self, cancelButtonTitle: "OK").show()
            return
        }
        
        var user:URUser! = URUser()
        user.email = self.txtLogin.text
        user.password = self.txtPassword.text
        
        URUser.login(user, completion: { (success) -> Void in
            if success {
                self.navigationController!.pushViewController(URMainViewController(nibName: "URMainViewController", bundle: nil), animated: true)
            }else {
                UIAlertView(title: nil, message: "Login/Password incorrect", delegate: self, cancelButtonTitle: "OK").show()
            }
        })
    }
    
    //MARK: Class Methods
    
    func setupUI() {
        self.navigationController?.navigationBar.barTintColor = URConstant.Color.LOGIN_PRIMARY
    }
    
}

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
        setupTextFieldView()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    //MARK: Button Events
    @IBAction func btForgotPasswordTapped(sender: AnyObject) {
        self.navigationController?.pushViewController(URForgotPasswordViewController(nibName:"URForgotPasswordViewController",bundle:nil), animated: true)
    }

    @IBAction func btLoginTapped(sender: AnyObject) {
        self.navigationController!.pushViewController(URMainViewController(nibName: "URMainViewController", bundle: nil), animated: true)
    }
    
    //MARK: Class Methods
    
    private func setupTextFieldView() {
        self.viewPassword.layer.borderWidth = 1
        self.viewLogin.layer.borderWidth = 1
        
        self.viewPassword.layer.borderColor = UIColor.grayColor().CGColor
        self.viewLogin.layer.borderColor = UIColor.grayColor().CGColor
    }
    
}

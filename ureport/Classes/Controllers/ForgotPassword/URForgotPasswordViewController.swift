//
//  URForgotPasswordViewController.swift
//  ureport
//
//  Created by Daniel Amaral on 13/07/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

class URForgotPasswordViewController: UIViewController {

    @IBOutlet weak var lbMessage: UILabel!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btSendPassword: UIButton!
    @IBOutlet weak var viewEmail: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFieldView()
    }

    //MARK: Button Events
    
    @IBAction func btSendPasswordTapped(sender: AnyObject) {
        
    }

    //MARK: Class Methods
    
    private func setupTextFieldView() {
        self.viewEmail.layer.borderWidth = 1
        
        self.viewEmail.layer.borderColor = UIColor.grayColor().CGColor
    }
    

}

//
//  URUserRegisterViewController.swift
//  ureport
//
//  Created by Daniel Amaral on 07/07/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

class URUserRegisterViewController: UIViewController {

    @IBOutlet weak var viewName: UIView!
    @IBOutlet weak var viewNick: UIView!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewAge: UIView!
    @IBOutlet weak var viewCountry: UIView!
    @IBOutlet weak var viewGender: UIView!
    @IBOutlet weak var btNext: UIButton!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtNick: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtGender: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFieldView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    //Mark: Button Events
    
    @IBAction func btNextTapped(sender: AnyObject) {
        
    }
    
    //Mark: Class Methods
    
    func setupTextFieldView() {
        self.viewName.layer.borderWidth = 1
        self.viewNick.layer.borderWidth = 1
        self.viewEmail.layer.borderWidth = 1
        self.viewAge.layer.borderWidth = 1
        self.viewCountry.layer.borderWidth = 1
        self.viewGender.layer.borderWidth = 1
        
        self.viewName.layer.borderColor = UIColor.grayColor().CGColor
        self.viewNick.layer.borderColor = UIColor.grayColor().CGColor
        self.viewEmail.layer.borderColor = UIColor.grayColor().CGColor
        self.viewAge.layer.borderColor = UIColor.grayColor().CGColor
        self.viewCountry.layer.borderColor = UIColor.grayColor().CGColor
        self.viewGender.layer.borderColor = UIColor.grayColor().CGColor
    }
    
}

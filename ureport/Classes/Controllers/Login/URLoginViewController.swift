//
//  URLoginViewController.swift
//  ureport
//
//  Created by Daniel Amaral on 07/07/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

class URLoginViewController: UIViewController {

    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var btLogin: UIButton!
    @IBOutlet weak var btFacebookLogin: UIButton!
    @IBOutlet weak var btGooglePlusLogin: UIButton!
    @IBOutlet weak var btSignUp: UIButton!
    @IBOutlet weak var btTwitterLogin: UIButton!
    
    var appDelegate:AppDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: Class Methods
    
    func setupUI() {
        self.btSignUp.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
    }
    
    //MARK: Button Events
    
    @IBAction func btTwitterTapped(sender: AnyObject) {
        self.navigationController!.pushViewController(URUserRegisterViewController(color: URConstant.Color.CONFIRM_INFO_PRIMARY), animated: true)
    }
    @IBAction func btLoginTapped(sender: AnyObject) {
        self.navigationController!.pushViewController(URLoginCredentialsViewController(nibName: "URLoginCredentialsViewController", bundle: nil), animated: true)
    }
    @IBAction func btFacebookTapped(sender: AnyObject) {
        self.navigationController!.pushViewController(URUserRegisterViewController(color: URConstant.Color.CONFIRM_INFO_PRIMARY), animated: true)
    }
    @IBAction func btGooglePlusTapped(sender: AnyObject) {
        self.navigationController!.pushViewController(URUserRegisterViewController(color: URConstant.Color.CONFIRM_INFO_PRIMARY), animated: true)
    }
    @IBAction func btSignUpTapped(sender: AnyObject) {
        self.navigationController!.pushViewController(URUserRegisterViewController(color: URConstant.Color.SIGNUP_PRIMARY), animated: true)
    }
}

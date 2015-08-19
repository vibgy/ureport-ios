//
//  AppDelegate.swift
//  ureport
//
//  Created by Daniel Amaral on 07/07/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, SWRevealViewControllerDelegate {

    var window: UIWindow?
    var loginViewController: URLoginViewController?
    var navigation:UINavigationController?
    var revealController:SWRevealViewController?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        loginViewController = URLoginViewController(nibName: "URLoginViewController", bundle: nil)
        
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent,animated:true)
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = URConstant.Color.YELLOW

        checkMainViewControllerToShow()
        
        return true
    }

    func checkMainViewControllerToShow(){
        if URUser.activeUser() != nil {
            var mainViewController:URMainViewController = URMainViewController()
            setupNavigationControllerWithMainViewController(URMainViewController())
        }else {

            setupNavigationControllerWithLoginViewController()
        }
    }
    
   //MARK: Navigation Methods
    
    func setupNavigationControllerWithMainViewController(viewController:UIViewController) {
        
        var menuViewController:ISMenuViewController = ISMenuViewController(nibName:"ISMenuViewController",bundle:nil)
        
        addLeftButtonMenuInViewController(viewController)
        
        if self.navigation == nil {
            self.navigation = UINavigationController(rootViewController: viewController)
            setupNavigationDefaultAtrributes()
            self.navigation!.navigationBar.translucent = true
        }
        
        if self.revealController == nil {
            self.revealController = SWRevealViewController(rearViewController: menuViewController, frontViewController: self.navigation)
            self.revealController!.rearViewRevealWidth = 237

            self.revealController!.delegate = self
            
            viewController.view.userInteractionEnabled = true
            viewController.view.addGestureRecognizer(self.revealController!.panGestureRecognizer())
            
        }
        
        self.window?.rootViewController = self.revealController
        self.window?.makeKeyAndVisible()        
        
    }
    
    func setupNavigationControllerWithLoginViewController() {
        
        if self.navigation == nil {
            self.navigation = UINavigationController(rootViewController: loginViewController!)
            setupNavigationDefaultAtrributes()
            self.navigation!.navigationBar.translucent = false
            self.navigation!.setNavigationBarHidden(true, animated: false)
        }
        
        self.window?.rootViewController = self.navigation;
        self.window?.makeKeyAndVisible()
    }
    
    func setupNavigationDefaultAtrributes() {
        self.navigation!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSFontAttributeName:UIFont(name: "Avenir-Light", size: 20) as! AnyObject
        ]
        self.navigation!.navigationBar.tintColor = UIColor.whiteColor()
        self.navigation!.navigationBar.barTintColor = URConstant.Color.PRIMARY
    }
    
    func addLeftButtonMenuInViewController(viewController:UIViewController){
        var image:UIImage = ISImageUtil.resizeImage(UIImage(named: "icon_burgermenu")!,scaledToSize: CGSize(width: 20, height: 16))
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: UIBarButtonItemStyle.Plain, target: self, action: "toggleMenu")
    }
    
    func toggleMenu() {
        self.revealController?.revealToggleAnimated(true)
    }
    
    //MARK: SWRevealViewControllerDelegate
    
    func revealController(revealController: SWRevealViewController!, didMoveToPosition position: FrontViewPosition) {

    }
    
}


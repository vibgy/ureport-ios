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
        
        self.navigation = UINavigationController(rootViewController: viewController)
        setupNavigationDefaultAtrributes()
        self.navigation!.navigationBar.translucent = true
        
        if self.revealController == nil {
            self.revealController = SWRevealViewController(rearViewController: menuViewController, frontViewController: self.navigation)
            self.revealController!.rearViewRevealWidth = 250

            self.revealController!.delegate = self
            
            viewController.view.userInteractionEnabled = true
            viewController.view.addGestureRecognizer(self.revealController!.panGestureRecognizer())
            
        }
        
        switchRootViewController(self.revealController!, animated: true, completion: nil)
        self.window?.makeKeyAndVisible()
        
    }
    
    func setupNavigationControllerWithLoginViewController() {
        
        self.navigation = UINavigationController(rootViewController: loginViewController!)
        setupNavigationDefaultAtrributes()
        self.navigation!.navigationBar.translucent = false
        self.navigation!.setNavigationBarHidden(true, animated: false)
        
        switchRootViewController(self.navigation!, animated: true, completion: nil)        
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
    

    func switchRootViewController(rootViewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        if animated {
            UIView.transitionWithView(window!, duration: 0.5, options: .TransitionCrossDissolve, animations: {
                let oldState: Bool = UIView.areAnimationsEnabled()
                UIView.setAnimationsEnabled(false)
                self.window!.rootViewController = rootViewController
                UIView.setAnimationsEnabled(oldState)
                }, completion: { (finished: Bool) -> () in
                    if completion != nil {
                        completion!()
                    }
            })
        } else {
            window!.rootViewController = rootViewController
        }
    }
    
}


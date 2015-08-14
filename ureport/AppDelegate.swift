//
//  AppDelegate.swift
//  ureport
//
//  Created by Daniel Amaral on 07/07/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var viewController: URLoginViewController?
    var navigation:UINavigationController?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        viewController = URLoginViewController(nibName: "URLoginViewController", bundle: nil)
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = URConstant.Color.YELLOW
        
        setupNavigationControllerWIthRootViewController(viewController!)
        
        self.window?.rootViewController = self.navigation;
        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {

    }

    func applicationDidEnterBackground(application: UIApplication) {

    }

    func applicationWillEnterForeground(application: UIApplication) {

    }

    func applicationDidBecomeActive(application: UIApplication) {

    }

    func applicationWillTerminate(application: UIApplication) {

    }

    func setupNavigationControllerWIthRootViewController(viewController:UIViewController) {
        
        if self.navigation == nil {
            self.navigation = UINavigationController(rootViewController: viewController)
            self.navigation!.navigationBar.tintColor = UIColor.whiteColor()
            self.navigation!.navigationBar.barTintColor = URConstant.Color.PRIMARY
            self.navigation!.navigationBar.translucent = false
            self.navigation!.setNavigationBarHidden(true, animated: false)
        }
    }
    
}


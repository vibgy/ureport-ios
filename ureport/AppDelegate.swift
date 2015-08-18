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
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var loginViewController: URLoginViewController?
    var navigation:UINavigationController?
    var revealController:PKRevealController?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent,animated:true)
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = URConstant.Color.YELLOW

        checkMainViewControllerToShow()
        
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

    func checkMainViewControllerToShow(){
        if URUser.activeUser() != nil {
            var mainViewController:URMainViewController = URMainViewController()
            setupNavigationControllerWithMainViewController(URMainViewController())
        }else {
            loginViewController = URLoginViewController(nibName: "URLoginViewController", bundle: nil)
            setupNavigationControllerWithLoginViewController(loginViewController!)
        }
    }
    
    func setupNavigationControllerWithMainViewController(viewController:UIViewController) {
        
        addLeftButtonMenuInViewController(viewController)
        var menuViewController:ISMenuViewController = ISMenuViewController(nibName:"ISMenuViewController",bundle:nil)
        
        if self.navigation == nil {
            self.navigation = UINavigationController(rootViewController: viewController)
            self.navigation!.navigationBar.tintColor = UIColor.whiteColor()
            self.navigation!.navigationBar.barTintColor = URConstant.Color.PRIMARY
            self.navigation!.navigationBar.translucent = true
        }
        
        if self.revealController == nil {
            self.revealController = PKRevealController(frontViewController: self.navigation, leftViewController: menuViewController)
            self.revealController?.setMinimumWidth(270, maximumWidth: 270, forViewController: menuViewController)
        }
    }
    
    func setupNavigationControllerWithLoginViewController(viewController:UIViewController) {
        
        if self.navigation == nil {
            self.navigation = UINavigationController(rootViewController: viewController)
            self.navigation!.navigationBar.tintColor = UIColor.whiteColor()
            self.navigation!.navigationBar.barTintColor = URConstant.Color.PRIMARY
            self.navigation!.navigationBar.translucent = false
            self.navigation!.setNavigationBarHidden(true, animated: false)
        }
    }
    
    func addLeftButtonMenuInViewController(viewController:UIViewController){
        var image:UIImage = ISImageUtil.resizeImage(UIImage(named: "icon_burgermenu")!,scaledToSize: CGSize(width: 20, height: 16))
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: UIBarButtonItemStyle.Plain, target: self, action: "toggleMenu")
    }
    
    func toggleMenu() {
        if !(self.revealController!.isPresentationModeActive) {
            self.revealController!.enterPresentationModeAnimated(true, completion: nil)
        }else{
            self.revealController!.resignPresentationModeEntirely(false, animated: true, completion: nil)
        }
    }
    
}


//
//  URMainViewController.swift
//  ureport
//
//  Created by Daniel Amaral on 13/08/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

class URMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        self.title = "U-Report"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    //MARK: Class Methods
    
    func setupViewControllers() {
        
        let storiesTableViewController:URStoriesTableViewController = URStoriesTableViewController()
        storiesTableViewController.title = "Stories"
        storiesTableViewController.tabBarItem.image = UIImage(named: "icon_stories")
        
        let pollsTableViewController:URPollTableViewController = URPollTableViewController(nibName:"URPollTableViewController",bundle:nil)
        pollsTableViewController.title = "Polls"
        pollsTableViewController.tabBarItem.image = UIImage(named: "icon_polls")     
        
        self.viewControllers = [storiesTableViewController,pollsTableViewController]
    }
    
    func addLeftButtonMenuInViewController(viewController:UIViewController){
        var image:UIImage = ISImageUtil.resizeImage(UIImage(named: "icon_burgermenu")!,scaledToSize: CGSize(width: 20, height: 16))
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: UIBarButtonItemStyle.Plain, target: self, action: "toggleMenu")
    }
}

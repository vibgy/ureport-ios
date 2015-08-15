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

}

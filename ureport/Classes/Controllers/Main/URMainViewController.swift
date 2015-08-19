//
//  URMainViewController.swift
//  ureport
//
//  Created by Daniel Amaral on 13/08/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

class URMainViewController: UITabBarController, UITabBarControllerDelegate{
    
    override func viewDidLoad() {
        
        var appDelegate:AppDelegate! = UIApplication.sharedApplication().delegate as! AppDelegate

        super.viewDidLoad()
        self.delegate = self
        setupViewControllers()
        self.title = "U-Report"        
    }
    
    override func viewWillAppear(animated: Bool) {
        tabBarController(self, didSelectViewController: URStoriesTableViewController())
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
    
    //MARK: SelectorMethods
    
    func newStory() {
        self.navigationController!.pushViewController(URAddStoryViewController(nibName:"URAddStoryViewController",bundle:nil), animated: true)
    }
    
    //MARK: TabBarControllerDelegate
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        if viewController is URStoriesTableViewController {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "New Story", style: UIBarButtonItemStyle.Done, target: self, action: "newStory")
        }
        
        if viewController is URPollTableViewController {
            self.navigationItem.rightBarButtonItem = nil
        }
    }
    
}

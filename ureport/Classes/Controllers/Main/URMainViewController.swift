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
        
        self.viewControllers = [storiesTableViewController]
    }

}

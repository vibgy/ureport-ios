//
//  URMainViewController.swift
//  ureport
//
//  Created by Daniel Amaral on 13/07/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

class URMainViewController: UIViewController {

    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var btAddStoryTapped: UIButton!
    @IBOutlet weak var viewContent: UIView!
    
    var storiesTableViewController:URStoriesTableViewController! = URStoriesTableViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadFirstView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupChildrensViewControllers()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    //MARK: Button Events
 
    @IBAction func segmentedControlTapped(sender: AnyObject) {
        self.segmentedControl = sender as! UISegmentedControl
        
        var index:Int! = self.segmentedControl.selectedSegmentIndex
        
        switch index {
            
        case 0 :
            if (self.viewContent.viewWithTag(index+1) == nil) {
                self.viewContent.addSubview(self.storiesTableViewController.view)
            }
            self.viewContent.hidden = false
            self.btAddStoryTapped.hidden = false
            
        default:
            self.viewContent.hidden = true
            self.btAddStoryTapped.hidden = true
        }
        
    }
    
    @IBAction func btAddStoryTapped(sender: AnyObject) {
        self.btAddStoryTapped = sender as! UIButton
        self.navigationController!.pushViewController(URAddStoryViewController(nibName:"URAddStoryViewController",bundle:nil), animated: true)
    }
    
    //MARK: Class Methods
    
    private func loadFirstView() {
        segmentedControlTapped(self.segmentedControl)
    }
    
    private func setupUI() {
        self.btAddStoryTapped.layer.cornerRadius = self.btAddStoryTapped.frame.size.width / 2
    }
    
    private func setupChildrensViewControllers() {
        var frame:CGRect! = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.size.width, height: self.viewContent.frame.size.height)

        self.storiesTableViewController.view.tag = 1
        self.storiesTableViewController.view.frame = frame
        self.addChildViewController(self.storiesTableViewController)
        
    }
}

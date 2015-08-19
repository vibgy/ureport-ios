//
//  ISMenuViewController.swift
//  TimeDePrimeira
//
//  Created by Daniel Amaral on 29/07/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

class ISMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var lbStoriesAndPolls: UILabel!
    @IBOutlet weak var lbPoints: UILabel!
    @IBOutlet weak var lbNickName: UILabel!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btSwitchCountryProgram: UIButton!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var btLogout: UIButton!
    
    var appDelegate:AppDelegate?
    var menuList:[ISMenu] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMenu()
        loadUserInfo()
        setupTableViewCell()
        self.appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
    }

    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(ISMenuTableViewCell.self), forIndexPath: indexPath) as! ISMenuTableViewCell
        
        var menu:ISMenu! = self.menuList[indexPath.row]

        cell.setupCellWith(menu)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var menu:ISMenu! = (tableView.cellForRowAtIndexPath(indexPath) as! ISMenuTableViewCell).menu
        
//        var viewController:UIViewController! = menu.controller
//        self.appDelegate?.setThisControllerAsMainInNavigation(viewController)
    }
    
    //MARK: Button Events
    
    @IBAction func btLogoutTapped(sender: AnyObject) {
        URUser.deactivateUser()
        appDelegate?.setupNavigationControllerWithLoginViewController()
    }
    
    
    @IBAction func btCountryProgramTapped(sender: AnyObject) {
        
    }
    
    //MARK: Class Methods
    
    func loadUserInfo() {
        self.lbNickName.text = URUser.activeUser()?.nickname
        self.lbPoints.text = "Points: \(URUser.activeUser()?.points)"
        self.lbStoriesAndPolls.text = "Stories: \(URUser.activeUser()?.stories) Polls: \(URUser.activeUser()?.polls)"
    }
    
    private func setupMenu() {
        
        var menuItem1,menuItem2,menuItem3,menuItem4:ISMenu?
        
        menuItem1 = ISMenu()
        menuItem1?.title = "Main"
//        menuItem1?.controller = TPMovementViewController(nibName:"TPMovementViewController",bundle:nil)
        
        menuItem2 = ISMenu()
        menuItem2?.title = "Chat"
//        menuItem2?.controller = TPCalendarViewController(nibName:"TPCalendarViewController",bundle:nil)
        
        menuItem3 = ISMenu()
        menuItem3?.title = "Institucional"
//        menuItem3?.controller = ISMapViewController(nibName:"ISMapViewController",bundle:nil)
        
        menuItem4 = ISMenu()
        menuItem4?.title = "Settings"
        //        menuItem3?.controller = ISMapViewController(nibName:"ISMapViewController",bundle:nil)
        
        menuList = [menuItem1!,menuItem2!,menuItem3!,menuItem4!]
    }
    
    private func setupTableViewCell() {
        self.tableView.registerNib(UINib(nibName: "ISMenuTableViewCell", bundle: nil), forCellReuseIdentifier: NSStringFromClass(ISMenuTableViewCell.self))
        self.tableView.separatorColor = UIColor.clearColor()
    }
}

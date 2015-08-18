//
//  ISMenuViewController.swift
//  TimeDePrimeira
//
//  Created by Daniel Amaral on 29/07/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

class ISMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var appDelegate:AppDelegate?
    var menuList:[ISMenu] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMenu()
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
    
    //MARK: Class Methods
    
    private func setupMenu() {
        
        var menuItem1,menuItem2,menuItem3:ISMenu?
        
        menuItem1 = ISMenu()
        menuItem1?.title = "O Movimento"
//        menuItem1?.controller = TPMovementViewController(nibName:"TPMovementViewController",bundle:nil)
        
        menuItem2 = ISMenu()
        menuItem2?.title = "Calendário"
//        menuItem2?.controller = TPCalendarViewController(nibName:"TPCalendarViewController",bundle:nil)
        
        menuItem3 = ISMenu()
        menuItem3?.title = "Transmissão"
//        menuItem3?.controller = ISMapViewController(nibName:"ISMapViewController",bundle:nil)
        
        menuList = [menuItem1!,menuItem2!,menuItem3!]
    }
    
    private func setupTableViewCell() {
        self.tableView.registerNib(UINib(nibName: "ISMenuTableViewCell", bundle: nil), forCellReuseIdentifier: NSStringFromClass(ISMenuTableViewCell.self))
        self.tableView.separatorColor = UIColor.clearColor()
    }
}

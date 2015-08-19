//
//  URStoriesTableViewController.swift
//  ureport
//
//  Created by Daniel Amaral on 14/07/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

class URStoriesTableViewController: UITableViewController {

    let imgViewHistoryHeight:CGFloat = 148.0
    let fullHeightTableViewCell:CGFloat = 434
    let contentViewBottom = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()                
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 434 - imgViewHistoryHeight
        }else {
            return 434
        }
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(URStoriesTableViewCell.self), forIndexPath: indexPath) as! URStoriesTableViewCell
        
        if indexPath.row == 0 {
            cell.imgStoryHeight.constant = 0
        }else {
            cell.imgStoryHeight.constant = imgViewHistoryHeight
        }

        cell.contentView.layoutIfNeeded()
        cell.viewController = self
        
        var story:URStory! = URStory()
        story.title = "Increasing Immunization Coverage in Uganda: The Community Problem-solving and Strategy Development Approach"
        story.contributions = 2
        story.user?.nickname = "Daniel"
        cell.setupCellWith(story)
        
        return cell
    }
    
    //MARK: Class Methods
    
    private func setupTableView() {
        self.tableView.backgroundColor = URConstant.Color.WINDOW_BACKGROUND
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 49, 0);
        
        self.tableView.registerNib(UINib(nibName: "URStoriesTableViewCell", bundle: nil), forCellReuseIdentifier: NSStringFromClass(URStoriesTableViewCell.self))
        self.tableView.separatorColor = UIColor.clearColor()
    }
    
}

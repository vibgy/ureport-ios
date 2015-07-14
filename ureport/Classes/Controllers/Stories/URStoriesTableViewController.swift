//
//  URStoriesTableViewController.swift
//  ureport
//
//  Created by Daniel Amaral on 14/07/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

class URStoriesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewCell()
        
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 250
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(URStoriesTableViewCell.self), forIndexPath: indexPath) as! URStoriesTableViewCell
        
        var story:URStory! = URStory()
        story.name = "Increasing Immunization Coverage in Uganda: The Community Problem-solving and Strategy Development Approach"
        story.contributions = 2
        story.author = "Daniel"
        cell.setupCellWith(story)
        
        return cell
    }
    
    //MARK: Class Methods

    private func setupTableViewCell() {
        self.tableView.registerNib(UINib(nibName: "URStoriesTableViewCell", bundle: nil), forCellReuseIdentifier: NSStringFromClass(URStoriesTableViewCell.self))
        self.tableView.separatorColor = UIColor.clearColor()
    }
    
}

//
//  URMarkerTableViewController.swift
//  ureport
//
//  Created by Daniel Amaral on 14/08/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

class URMarkerTableViewController: UITableViewController, MarkerDelegate{

    var markerList:[URMarker] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()        
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 44
    }
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(URAddMarkerTableViewCell.self)) as! URAddMarkerTableViewCell        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(URMarkerTableViewCell.self), forIndexPath: indexPath) as! URMarkerTableViewCell

        cell.delegate = self
        
        let marker:URMarker = URMarker()
        marker.name = "Violence"
        cell.setupCellWith(marker)
        
        return cell
    }
    
    //MARK: Class Methods
    
    private func setupTableView() {
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 49, 0);
        
        self.tableView.registerNib(UINib(nibName: "URMarkerTableViewCell", bundle: nil), forCellReuseIdentifier: NSStringFromClass(URMarkerTableViewCell.self))
        
        self.tableView.registerNib(UINib(nibName: "URAddMarkerTableViewCell", bundle: nil), forCellReuseIdentifier: NSStringFromClass(URAddMarkerTableViewCell.self))
        
        self.tableView.separatorColor = UIColor.clearColor()
    }
    
    //MARK: MarkerDelegate
    
    func markerHasTapped(marker: URMarker) {
        print(marker.name!, terminator: "")
    }
    
}

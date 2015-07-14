//
//  URAddStoryViewController.swift
//  ureport
//
//  Created by Daniel Amaral on 14/07/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

class URAddStoryViewController: UIViewController {

    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var viewTitle: UIView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtHistory: UITextView!
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var btAddImgCover: UIButton!
    @IBOutlet weak var btSendHistory: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    //Mark: Button Events
    
    @IBAction func btSendHistoryTapped(sender: AnyObject) {
        self.navigationController!.popViewControllerAnimated(true)
    }
    
    @IBAction func btAddImgCoverTapped(sender: AnyObject) {
        
    }
    
    //MARK: Class Methods
    
    private func setupUI() {
        self.viewTop.layer.borderWidth = 1
        self.viewTitle.layer.borderWidth = 1
        self.txtHistory.layer.borderWidth = 1
        
        self.viewTop.layer.borderColor = UIColor.grayColor().CGColor
        self.viewTitle.layer.borderColor = UIColor.grayColor().CGColor
        self.txtHistory.layer.borderColor = UIColor.grayColor().CGColor
    }
    
}

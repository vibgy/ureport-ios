//
//  URStoriesTableViewCell.swift
//  ureport
//
//  Created by Daniel Amaral on 14/07/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

class URStoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbAuthorName: UILabel!
    @IBOutlet weak var lbContributions: UILabel!
    @IBOutlet weak var lbMarkers: UILabel!
    @IBOutlet weak var imgStory: UIImageView!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var btContribute: UIButton!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var contentViewBottom: NSLayoutConstraint!
    @IBOutlet weak var imgStoryHeight: NSLayoutConstraint!
    
    var viewController:UITableViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        super.selectionStyle = UITableViewCellSelectionStyle.None
        // Configure the view for the selected state
    }
    
    //MARK: Button Events
    
    @IBAction func btContributeTapped(sender: AnyObject) {
        viewController?.navigationController?.pushViewController(URAddStoryViewController(nibName:"URAddStoryViewController",bundle:nil), animated: true)
    }
    
    //MARK: Class Methods
    
    func setupCellWith(story:URStory){
        self.lbAuthorName.text = story.title!
        self.lbContributions.text = "\(story.contributions!) contributions"
        self.lbAuthorName.text = "BY \(story.user?.nickname!.uppercaseString)"
    }
}

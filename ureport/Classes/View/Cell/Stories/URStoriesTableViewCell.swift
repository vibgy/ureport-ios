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
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: Button Events
    
    @IBAction func btReadFullStoryTapped(sender: AnyObject) {
        
    }
    
    //MARK: Class Methods
    
    func setupCellWith(story:URStory){
        self.lbAuthorName.text = story.title!
        self.lbContributions.text = "\(story.contributions!) contributions"
        self.lbAuthorName.text = "BY \(story.user?.nickname!.uppercaseString)"
    }
}

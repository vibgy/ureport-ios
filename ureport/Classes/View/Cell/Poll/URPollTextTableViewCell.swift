//
//  URPollTextTableViewCell.swift
//  ureport
//
//  Created by Daniel Amaral on 13/08/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

class URPollTextTableViewCell: UITableViewCell {

    @IBOutlet weak var lbCurrentPoll: UILabel!
    @IBOutlet weak var lbCategoryName: UILabel!
    @IBOutlet weak var lbDescr: UILabel!
    @IBOutlet weak var lbClosedDate: UILabel!
    @IBOutlet weak var txtAnswer: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        super.selectionStyle = UITableViewCellSelectionStyle.None
        // Configure the view for the selected state
    }
    
    //MARK: Class Methods
    
    func setupCellWithData() {
        
    }
    
}

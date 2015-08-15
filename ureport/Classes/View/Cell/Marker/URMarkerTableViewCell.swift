//
//  URMarkerTableViewCell.swift
//  ureport
//
//  Created by Daniel Amaral on 14/08/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

protocol MarkerDelegate {
    func markerHasTapped(marker:URMarker)
}

class URMarkerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var btCheck: UIButton!
    @IBOutlet weak var lbName: UILabel!
    
    var marker:URMarker!
    var delegate:MarkerDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        super.selectionStyle = UITableViewCellSelectionStyle.None
    }
    
    //MARK: Class Methods
    
    func setupCellWith(marker:URMarker) {
        self.marker = marker
        lbName.text = marker.name
    }
    
    //MARK: Button Events
    
    @IBAction func btCheckTapped(sender: AnyObject) {
        if btCheck.selected {
            btCheck.selected = false
            btCheck.setBackgroundImage(UIImage(named: "radio_button_Inactive"), forState: UIControlState.Normal)
            
            if let delegate = self.delegate {
                delegate.markerHasTapped(marker)
            }
            
        }else{
            btCheck.selected = true
            btCheck.setBackgroundImage(UIImage(named: "radio_button_active"), forState: UIControlState.Selected)
            
            if let delegate = self.delegate {
                delegate.markerHasTapped(marker)
            }
            
        }
    }
    
}

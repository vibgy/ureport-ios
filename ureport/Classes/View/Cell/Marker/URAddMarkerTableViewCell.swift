//
//  URAddMarkerTableViewCell.swift
//  ureport
//
//  Created by Daniel Amaral on 14/08/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

class URAddMarkerTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var txtMarkerName: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: Textfield Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {   //delegate method        
        return true
    }
    
}

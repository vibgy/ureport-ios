//
//  URFireBaseManager.swift
//  ureport
//
//  Created by Daniel Amaral on 17/08/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit
import Firebase

class URFireBaseManager: NSObject {
    static let Path = "https://u-report.firebaseio.com/"
    static let Reference = Firebase(url: Path)

    class func sharedInstance() -> Firebase {
        return Reference
    }
    
}

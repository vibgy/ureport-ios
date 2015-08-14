//
//  URPoll.swift
//  ureport
//
//  Created by Daniel Amaral on 13/08/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

class URPoll: NSObject {
   
    var title:String?
    var expirationDate:NSDate?
    var category:URPollCategory?
    var responseRate:Int?
    var respondend:Int?
    var polled:Int?
    var questions:[URPollQuestion]?
    var results:[URPollResult]?
    
}

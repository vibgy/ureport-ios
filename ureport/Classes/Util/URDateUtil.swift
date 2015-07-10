//
//  URDateUtil.swift
//  ureport
//
//  Created by Daniel Amaral on 09/07/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

class URDateUtil: NSObject {
   
    class func brithDayFormatter(date:NSDate) -> String{
        return NSDateFormatter.localizedStringFromDate(date, dateStyle: NSDateFormatterStyle.MediumStyle, timeStyle: NSDateFormatterStyle.NoStyle)
    }
    
}

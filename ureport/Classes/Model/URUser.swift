//
//  URUser.swift
//  ureport
//
//  Created by Daniel Amaral on 13/08/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

class URUser: NSObject {
    
    var key:String?
    var nickname:String?
    var password:String?
    var email:String?
    var state:String?
    var birthday:NSDate?
    var country:String?
    var picture:String?
    var gender:URGender?
    var type:URType?
    var points:Int?
    var stories:Int?
    var polls:Int?
    
    class func path() -> String {
        return "user"
    }
    
    class func login(user:URUser,completion:(Bool) -> Void) {
        URFireBaseManager.sharedInstance().authUser(user.nickname, password: user.password,
            withCompletionBlock: { error, authData in
                if error != nil {
                    completion(false)
                } else {
                    completion(true)
                }
        })
    }
    
    class func save(object:NSObject) {
        URFireBaseManager.sharedInstance().childByAppendingPath(path()).setValue(object)
    }
        
    
}

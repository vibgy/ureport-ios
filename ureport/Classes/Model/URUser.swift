//
//  URUser.swift
//  ureport
//
//  Created by Daniel Amaral on 13/08/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

class URUser: NSObject{
    
    var key: String!
    var nickname: String!
    var password: String!
    var email: String!
    var state: String!
    var birthday: NSDate!
    var country: String!
    var picture: String!
    var gender: URGender!
    var type: URType!
    var points:Int?
    var stories:Int?
    var polls:Int?
    
    
    //MARK: FireBase Methods
    class func path() -> String {
        return "user"
    }
    
    class func login(user:URUser,completion:(Bool) -> Void) {
        URFireBaseManager.sharedInstance().authUser(user.email, password: user.password,
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
    
    
    class func activeUser() -> URUser? {
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var encodedData: NSData?
        
        encodedData = defaults.objectForKey("user") as? NSData
        
        if encodedData != nil {
            var user: URUser = URUser.fromJson((NSKeyedUnarchiver.unarchiveObjectWithData(encodedData!) as! NSDictionary))
            return user
        }else{
            return nil
        }
        
    }
    
    class func setActiveUser(user: URUser!) {
        self.deactivateUser()
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var encodedObject: NSData = NSKeyedArchiver.archivedDataWithRootObject(user.asJson())
        defaults.setObject(encodedObject, forKey: "user")
        defaults.synchronize()
    }
    
    class func deactivateUser() {
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        defaults.removeObjectForKey("user")
        defaults.synchronize()
    }
    
}

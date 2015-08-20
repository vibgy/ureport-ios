//
//  URUser.swift
//  ureport
//
//  Created by Daniel Amaral on 13/08/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit
import Firebase

class URUser: NSObject{
    
    var key: String!
    var nickname: String!
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
    
    class func login(email:String,password:String,completion:(FAuthenticationError?,Bool) -> Void) {
        URFireBaseManager.sharedInstance().authUser(email, password: password,
            withCompletionBlock: { error, authData in
                if error != nil {
                    
                    if let errorCode = FAuthenticationError(rawValue: error.code) {
                        switch (errorCode) {
                        case .UserDoesNotExist:
                            completion(FAuthenticationError.UserDoesNotExist,false)
                        case .InvalidEmail:
                            completion(FAuthenticationError.InvalidEmail,false)
                        case .InvalidPassword:
                            completion(FAuthenticationError.InvalidPassword,false)
                        default:
                            completion(FAuthenticationError.Unknown,false)
                        }
                    }
                } else {

                    URUser.getByKey(authData.uid, completion: { (user) -> Void in
                        if user != nil {
                            URUser.setActiveUser(user)
                            completion(nil,true)
                        }else{
                            completion(nil,false)
                        }
                    })
                }
        })
    }
    
    class func save(object:NSObject) {
        URFireBaseManager.sharedInstance().childByAppendingPath(path()).setValue(object)
    }
    
    class func getByKey(key:String,completion:(URUser?) -> Void){
        
     URFireBaseManager.sharedInstance().childByAppendingPath(path()).childByAppendingPath(key).observeSingleEventOfType(FEventType.Value, withBlock: { snapshot in
        if snapshot != nil {
            var user:URUser = URUser.fromJson(snapshot.value as! NSDictionary)
            completion(user)
        }else {
            completion(nil)
        }
     })
    }
    
    //MARK: User Account Manager
    
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

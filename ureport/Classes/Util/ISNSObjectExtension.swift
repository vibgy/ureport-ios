//
//  ISNSObject.swift
//  ureport
//
//  Created by Daniel Amaral on 18/08/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import Foundation

extension NSObject {
    class func fromJson(jsonInfo: NSDictionary) -> Self {
        let object = self.init()
        
        (object as NSObject).load(jsonInfo)
        
        return object
    }
    
    func load(jsonInfo: NSDictionary) {
        for (key, value) in jsonInfo {
            let keyName = key as! String
            
            if (respondsToSelector(NSSelectorFromString(keyName))) {
                setValue(value, forKey: keyName)
            }
        }
    }
    
    func propertyNames() -> [String] {
        var names: [String] = []
        var count: UInt32 = 0
        let properties = class_copyPropertyList(classForCoder, &count)
        for var i = 0; i < Int(count); ++i {
            let property: objc_property_t = properties[i]
            let name: String = String.fromCString(property_getName(property))!
            names.append(name)
        }
        free(properties)
        return names
    }
    
    func asJson() -> NSDictionary {
        var json:Dictionary<String, AnyObject> = [:]
        
        for name in propertyNames() {
            if let value: AnyObject = valueForKey(name) {
                json[name] = value
            }
        }
        
        
        return json
    }
    
}

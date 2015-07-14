//
//  URCountry.swift
//  ureport
//
//  Created by Daniel Amaral on 09/07/15.
//  Copyright (c) 2015 ilhasoft. All rights reserved.
//

import UIKit

class URCountry: NSObject {

    var code:String?
    var name:String?
    
    class func getCountries () -> AnyObject {

        var countries: [URCountry] = []
        
        for code in NSLocale.ISOCountryCodes() as! [String] {
            var country:URCountry? = URCountry()

            let id = NSLocale.localeIdentifierFromComponents([NSLocaleCountryCode: code])
            let name = NSLocale(localeIdentifier: NSLocale.preferredLanguages()[0] as! String).displayNameForKey(NSLocaleIdentifier, value: id) ?? "Country not found for code: \(code)"
            
            country!.code = code
            country!.name = name
            
            countries.append(country!)
        }
        
        return countries
        
    }
    
    class func getCurrentURCountry() -> URCountry {
        var country:URCountry? = URCountry()
        
        var locale:NSLocale! = NSLocale.currentLocale()
        country!.code = locale.objectForKey(NSLocaleCountryCode) as? String
        country!.name = locale.displayNameForKey(NSLocaleCountryCode, value: country!.code!)
        return country!
    }

}

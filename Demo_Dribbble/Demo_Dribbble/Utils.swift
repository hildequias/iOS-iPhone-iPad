//
//  Utils.swift
//  Demo_Dribbble
//
//  Created by Pixonsoft on 2/18/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//

import Foundation

class Utils: NSObject {
    
    class func getStringFromJSON(data: NSDictionary, key: String) -> String{
        
        //let info : AnyObject? = data[key]
        
        if let info = data[key] as? String {
            return info
        }
        return ""
    }
    
    class func stripHTML(str: NSString) -> String {
        
        var stringToStrip = str
        var r = stringToStrip.rangeOfString("<[^>]+>", options:.RegularExpressionSearch)
        while r.location != NSNotFound {
            
            stringToStrip = stringToStrip.stringByReplacingCharactersInRange(r, withString: "")
            r = stringToStrip.rangeOfString("<[^>]+>", options:.RegularExpressionSearch)
        }
        
        return stringToStrip as String
    }
    
    class func formatDate(dateString: String) -> String {
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = formatter.dateFromString(dateString)
        
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter.stringFromDate(date!)
    }
    
}
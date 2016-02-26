//
//  Comment.swift
//  Demo_Dribbble
//
//  Created by Pixonsoft on 2/18/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//

import Foundation

class Comment: NSObject {
    
    var id : Int!
    var body : String!
    var date : String!
    
    var user : User!
    
    init(data : NSDictionary){
        
        self.id = data["id"] as! Int
        let bodyHTML = Utils.getStringFromJSON(data, key: "body")
        self.body = Utils.stripHTML(bodyHTML)
        
        let dateInfo = Utils.getStringFromJSON(data, key: "created_at")
        self.date = Utils.formatDate(dateInfo)
        
        if let userData = data["user"] as? NSDictionary {
            self.user = User(data: userData)
        }
    }
    
}
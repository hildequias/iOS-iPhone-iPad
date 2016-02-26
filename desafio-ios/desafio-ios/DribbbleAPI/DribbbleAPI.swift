//
//  DribbbleAPI.swift
//  desafio-ios
//
//  Created by Mobile6 on 11/3/15.
//  Copyright © 2015 Hildequias. All rights reserved.
//

import Foundation


class DribbbleAPI {
    
    let accessToken = "dc5a71673c52e02fb510a7bf514789a90c1d9c169c13edbd92e5e19ba74a5f56"
    
    func loadShots(shotsUrl: String, completion: (([Shot]) -> Void)!) {
    
        let urlString = shotsUrl + "?access_token=" + accessToken + "&page=1&per_page=100"
        
        let session = NSURLSession.sharedSession()
        let shotsUrl = NSURL(string: urlString)
        
        let task = session.dataTaskWithURL(shotsUrl!){
            (data, response, error) -> Void in
            
            if error != nil {
                print(error!.localizedDescription)
            } else {
                
            
                var shots = [Shot]()
                do {
                    let shotsData = try NSJSONSerialization.JSONObjectWithData(data! , options: NSJSONReadingOptions.MutableContainers) as! NSArray
                    
                    for shot in shotsData{
                        let shot = Shot(data: shot as! NSDictionary)
                        shots.append(shot)
                    }

                }catch{
                    
                }
                
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    dispatch_async(dispatch_get_main_queue()) {
                        completion(shots)
                    }
                }
                
            }
        }
        
        task.resume()
    }

    func loadShotsForBucket(shotsUrl: String, completion: (([Shot]) -> Void)!) {
        
        let urlString = shotsUrl + "?access_token=" + accessToken + "&page=1&per_page=100"
        
        let session = NSURLSession.sharedSession()
        let shotsUrl = NSURL(string: urlString)
        
        let task = session.dataTaskWithURL(shotsUrl!){
            (data, response, error) -> Void in
            
            if error != nil {
                print(error!.localizedDescription)
            } else {
                
                
                var shots = [Shot]()
                
                do {
                    let shotsData = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSArray
                    
                    for shot in shotsData{
                        let shot = Shot(data: shot as! NSDictionary)
                        shots.append(shot)
                    }
                    
                }catch{
                    
                }
                
                
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    dispatch_async(dispatch_get_main_queue()) {
                        completion(shots)
                    }
                }
                
            }
        }
        
        task.resume()
    }

    
    func loadComments(commentsUrl: String, completion: (([Comment]) -> Void)!) {
        
        let urlString = commentsUrl + "?access_token=" + accessToken
        
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlString)
        let task = session.dataTaskWithURL(url!){
            (data, response, error) -> Void in
            
            if error != nil {
                print(error!.localizedDescription)
            } else {
                
                
                var comments = [Comment]()
                do{
                    let commentsData = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)as! NSArray
                    
                    
                    for commentData in commentsData{
                        let comment = Comment(data: commentData as! NSDictionary)
                        comments.append(comment)
                    }
                    
                }catch {
                    
                }
                
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    dispatch_async(dispatch_get_main_queue()) {
                        completion(comments)
                    }
                }
                
            }
        }
        
        task.resume()
    }

    func loadUsers(usersUrl: String, completion: (([User]) -> Void)!) {
        
        let urlString = usersUrl + "?access_token=" + accessToken
        
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlString)
        let task = session.dataTaskWithURL(url!){
            (data, response, error) -> Void in
            
            if error != nil {
                print(error!.localizedDescription)
            } else {
                
                var users = [User]()
                do {
                    let usersData = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSArray
                    
                    for userData in usersData{
                        let user = User(data: userData["followee"] as! NSDictionary)
                        users.append(user)
                    }
                }catch {
                    
                }
                
                
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    dispatch_async(dispatch_get_main_queue()) {
                        completion(users)
                    }
                }
            }
        }
        
        task.resume()
    }
}

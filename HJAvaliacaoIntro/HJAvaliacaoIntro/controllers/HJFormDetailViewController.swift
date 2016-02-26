//
//  HJFormDetailViewController.swift
//  HJAvaliacaoIntro
//
//  Created by Hildequias Silas dos Santos Junior Convidado on 23/02/16.
//  Copyright © 2016 pixonsoft. All rights reserved.
//

import UIKit

class HJFormDetailViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    var theName:String!
    var theEmail:String!
    var thePhoneNumber:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = theName;
        emailLabel.text = theEmail;
        phoneNumberLabel.text = thePhoneNumber
    }
    
}
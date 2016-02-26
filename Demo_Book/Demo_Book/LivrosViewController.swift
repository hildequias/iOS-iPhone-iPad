//
//  LivrosViewController.swift
//  Demo_Book
//
//  Created by Mobile6 on 2/22/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//

import UIKit

class LivrosViewController: UIViewController {
    
    
    @IBAction func buttonTap(sender: UIButton) {
        
        self.performSegueWithIdentifier("livroToDetalheSegue", sender: sender)
        
        self.performSegueWithIdentifier("filmeToDetalheSegue", sender: sender) 
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "livroToDetalheSegue"){
            let vc:DetalheViewController = segue.destinationViewController as! DetalheViewController
            vc.itemIdx = sender!.tag
            vc.isFromLivro = true
        }
    }
    
}
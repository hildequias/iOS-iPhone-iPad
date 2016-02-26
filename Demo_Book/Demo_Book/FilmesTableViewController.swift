//
//  FilmesTableViewController.swift
//  Demo_Book
//
//  Created by Mobile6 on 2/22/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//

import UIKit

class FilmesTableViewController: UITableViewController, DetalheViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func buttonTap(sender: UIButton) {
        self.performSegueWithIdentifier("filmeToDetalheSegue", sender: sender) 
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "filmeToDetalheSegue") {
        let vc:DetalheViewController = segue.destinationViewController as! DetalheViewController
        vc.itemIdx = sender!.tag
        vc.isFromLivro = false
        vc.delegate = self
        }
    }
    
    func buttonTappedWithPart(numTapped:Int) {
        let alert: UIAlertController = UIAlertController(title: "Finalizado", message: "Parte \(numTapped)", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
    }
    
}

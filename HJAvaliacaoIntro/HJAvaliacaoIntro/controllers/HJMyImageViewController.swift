//
//  HJMyImageViewController.swift
//  HJAvaliacaoIntro
//
//  Created by Hildequias Silas dos Santos Junior Convidado on 23/02/16.
//  Copyright © 2016 pixonsoft. All rights reserved.
//

import UIKit

class HJMyImageViewController: UIViewController, ImageSelectViewControllerDelegate {
    
    
    @IBOutlet weak var image: UIImageView!
    
    @IBAction func selectImage(sender: UIButton) {
    }
    
    func fruitIsSelected(fruit: String) {
        self.image.image = UIImage(named: fruit)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "selectToImageSegue") {
            let vc:HJImageSelectViewController = segue.destinationViewController as! HJImageSelectViewController
            vc.delegate = self
        }
    }
}
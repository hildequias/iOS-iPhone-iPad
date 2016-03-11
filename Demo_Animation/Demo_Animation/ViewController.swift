//
//  ViewController.swift
//  Demo_Animation
//
//  Created by Mobile6 on 3/10/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgSonic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.imgSonic.animationDuration = 1
        self.imgSonic.animationRepeatCount = 8
        self.imgSonic.animationImages = [UIImage (named:"sonic1")!, UIImage (named:"sonic2")!, UIImage (named:"sonic3")!, UIImage (named:"sonic4")!, UIImage (named:"sonic5")!, UIImage (named:"sonic6")!, UIImage (named:"sonic7")!, UIImage (named:"sonic8")!];
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func girar(sender: UIButton) {
        
        let angle:CGFloat = (180.0 * CGFloat(M_PI)) / 180.0
        UIView.animateWithDuration(0.3, animations: { () -> Void in

            self.imgSonic.transform = CGAffineTransformMakeRotation(angle)
            self.imgSonic.transform = CGAffineTransformMakeRotation(0)
            
        })
    }

    @IBAction func saltar(sender: UIButton) {
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            
            self.imgSonic.center = CGPointMake(self.imgSonic.center.x, self.imgSonic.center.y - 180)

            }){ (completed) -> Void in
                
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    
                    self.imgSonic.center = CGPointMake(self.imgSonic.center.x, self.imgSonic.center.y + 180)
                })
        }
    }
    
    @IBAction func correr(sender: UIButton) {
    
        if(!self.imgSonic.isAnimating()){
            self.imgSonic.startAnimating()
        }else{
            self.imgSonic.stopAnimating()
        }
    }
}


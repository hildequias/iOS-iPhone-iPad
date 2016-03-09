//
//  ViewController.swift
//  Demo_StackView
//
//  Created by Mobile6 on 3/1/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackFrutas: UIStackView!
    @IBOutlet weak var sw: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeVerticalHorizontal(sender: UISwitch) {
        
        UIView.animateWithDuration(1.0) { () -> Void in
            
            if(sender.on){
                self.stackFrutas.axis = UILayoutConstraintAxis.Horizontal
            }else{
                self.stackFrutas.axis = UILayoutConstraintAxis.Vertical
            }
        }
    }
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        
        UIView.animateWithDuration(1.0) { () -> Void in
        
            if(toInterfaceOrientation == UIInterfaceOrientation.Portrait || toInterfaceOrientation == UIInterfaceOrientation.PortraitUpsideDown ){ //|| self.sw.on
                self.stackFrutas.axis = UILayoutConstraintAxis.Vertical
            }else{
                self.stackFrutas.axis = UILayoutConstraintAxis.Horizontal
            }
        }
    }
}


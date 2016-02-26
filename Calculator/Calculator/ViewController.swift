//
//  ViewController.swift
//  Calculator
//
//  Created by Mobile6 on 1/28/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//

import UIKit

//MARK: - Class Implementation
class ViewController: UIViewController {
    
    //MARK: - Private objects
    var calcOper:CalcOperation = CalcOperation()
    var arrItens:[String] = [String]()
    
    //MARK: - Interface Objects
    @IBOutlet weak var lblResult: UILabel!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Buttons Clicks
    @IBAction func buttonTap(sender: UIButton) {
    
        if(sender.titleLabel!.text == "CA"){
            lblResult.text = ""
        }else{
            
            self.arrItens.append(sender.titleLabel!.text!)
            self.lblResult.text = self.lblResult.text! + sender.titleLabel!.text!
        }
    }
    
    //MARK: - Button Click =
    @IBAction func calcOp(sender: UIButton) {
        let result:Double = self.calcOper.calculateWithArray(self.arrItens)
        self.lblResult.text = "\(result)"
        self.arrItens.removeAll(keepCapacity: false)
    }
}


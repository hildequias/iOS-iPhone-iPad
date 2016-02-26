//
//  ImageSelectViewController.swift
//  HJAvaliacaoIntro
//
//  Created by Hildequias Silas dos Santos Junior Convidado on 23/02/16.
//  Copyright © 2016 pixonsoft. All rights reserved.
//

import UIKit

protocol ImageSelectViewControllerDelegate: class {
    func fruitIsSelected(fruit:String) -> Void
}

class HJImageSelectViewController: UIViewController {
    
    var delegate:ImageSelectViewControllerDelegate?
    
    var frutsArr:[String] = ["abacaxi", "banana", "cereja", "kiwi", "laranja", "limao", "manga", "uva"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var x:CGFloat = 0
        var y:CGFloat = 40
        var index:Int = 0
        
        for str:String in frutsArr{
            
            if(index % 2 == 0 && index != 0){
                x = 20
                y += 110
                
            }else if(index != 0){
                x = 180
            }
            
            let btn = UIButton()
            btn.setImage(UIImage(named: str), forState: UIControlState.Normal)
            btn.frame = CGRectMake(x, y, 100, 100)
            btn.addTarget(self, action: "fruitClick:", forControlEvents: UIControlEvents.TouchUpInside)
            btn.tag = index
            self.view.addSubview(btn)
            index++
        }
    }
    
    @IBAction func fruitClick(sender: UIButton) {
        self.delegate?.fruitIsSelected(frutsArr[sender.tag])
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}


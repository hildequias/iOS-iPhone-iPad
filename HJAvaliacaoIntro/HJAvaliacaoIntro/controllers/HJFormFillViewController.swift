//
//  HJFormFillViewController.swift
//  HJAvaliacaoIntro
//
//  Created by Hildequias Silas dos Santos Junior Convidado on 23/02/16.
//  Copyright © 2016 pixonsoft. All rights reserved.
//

import Foundation
import UIKit

class HJFormFillViewController:UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var txName: UITextField!
    @IBOutlet weak var txEmail: UITextField!
    @IBOutlet weak var txPhoneNumber: UITextField!
    
    @IBAction func goToNext(sender: UIButton) {
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if (textField == self.txName){
            txEmail.becomeFirstResponder()
        }else if(textField == self.txEmail){
            txPhoneNumber.becomeFirstResponder()
        }else if(textField == self.txPhoneNumber){
            textField.resignFirstResponder()
        }
        
        return false;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "formToDetalheSegue") {
            let vc:HJFormDetailViewController = segue.destinationViewController as! HJFormDetailViewController
            vc.theName = txName.text
            vc.theEmail = txEmail.text
            vc.thePhoneNumber = txPhoneNumber.text
        }
    }
    
}

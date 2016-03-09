//
//  ViewController.swift
//  Demo_fileManager
//
//  Created by Mobile6 on 3/1/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        
        let docPath: String = paths[0]
        
        let textFilePath = ("\(docPath)/myfile.txt")
        
        let meuTexto:String = "Meu Texto"
        
        let data: NSData = meuTexto.dataUsingEncoding(NSUTF8StringEncoding)!
        
        NSFileManager.defaultManager().createFileAtPath(textFilePath, contents: data, attributes:nil)
        
        
        if let pListPath = NSBundle.mainBundle().pathForResource("ListaTenis", ofType: "plist"){
            
            let arr = NSArray(contentsOfFile: pListPath)
            
            for dict in arr! {
                let nome = dict["Nome"]!
                let valor = dict["Valor"]!
                
                print("\(nome!) - \(valor!)")
            }
        }
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("bgColor") == nil){
            NSUserDefaults.standardUserDefaults().setValue("s", forKey: "bgColor")
            NSUserDefaults.standardUserDefaults().synchronize()
            self.view.backgroundColor = UIColor.blueColor()
        }else{
            NSUserDefaults.standardUserDefaults().removeObjectForKey("bgColor")
            NSUserDefaults.standardUserDefaults().synchronize()
            self.view.backgroundColor = UIColor.redColor()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


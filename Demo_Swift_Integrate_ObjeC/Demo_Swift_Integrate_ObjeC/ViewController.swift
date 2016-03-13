//
//  ViewController.swift
//  Demo_Swift_Integrate_ObjeC
//
//  Created by Mobile6 on 3/12/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var valor1: UITextField!
    @IBOutlet weak var valor2: UITextField!
    @IBOutlet weak var resultado: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func somar(sender: UIButton) {

        let cal = Calcular()
        
        let val1:Double = Double(valor1.text!)!
        let val2:Double = Double(valor2.text!)!
        
        resultado.text = String(cal.somar(val1, andValor2: val2))
    }

    @IBAction func subtrair(sender: UIButton) {
        
        let cal = Calcular()
        
        let val1:Double = Double(valor1.text!)!
        let val2:Double = Double(valor2.text!)!
        
        resultado.text = String(cal.subtrair(val1, andValor2: val2))
    }
}


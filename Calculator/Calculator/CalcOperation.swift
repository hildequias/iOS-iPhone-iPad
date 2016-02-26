//
//  CalcOperation.swift
//  Calculator
//
//  Created by Mobile6 on 1/28/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//

import Foundation

class CalcOperation: NSObject {
    
    func calculateWithArray(anArr:[String]) -> Double {
        
        var total:Double = 0.0
        var opr:String = ""
        var val:String = ""
        
        for str:String in anArr {
            if(str == "") {
                
                
            }else if(str == "+" || str == "-" || str == "/" || str == "X"){
                opr = str
                
            }else if(opr != ""){
                if (opr == "+"){
                    total += Double(val+str)!
                }
                if (opr == "-"){
                    total = total - Double(val+str)!
                }
                if (opr == "/"){
                    
                    if (Double(str)! != 0.0){
                        total = total / Double(val+str)!
                    }else{
                        
                    }
                }
                if (opr == "X"){
                    total = total * Double(val+str)!
                }
                opr = ""
                
            }else{
                val = val + str
            }
        }
        
        return total
    }
    
}
//
//  HJLocationVO.swift
//  HJGuia Turismo
//
//  Created by Usuário Convidado on 12/03/16.
//  Copyright © 2016 pixonsoft. All rights reserved.
//

import Foundation

class HJLocationVO: NSObject {
    
    var name:String!
    var address:String!
    var imagem:String!
    var lat:Double!
    var log:Double!
    var index:Int!
    
    init(data : NSDictionary){
        
        self.name = data["nome"] as! String
        self.address = data["endereco"] as! String
        self.imagem = data["imagem"] as! String
        
        if let coordenadas = data["coordenadas"] as? NSDictionary {
            self.lat = coordenadas["lat"] as! Double
            self.log = coordenadas["lon"] as! Double
        }
    }
}

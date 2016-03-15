//
//  LocationAnnotation.swift
//  HJGuia Turismo
//
//  Created by Usuário Convidado on 12/03/16.
//  Copyright © 2016 pixonsoft. All rights reserved.
//

import UIKit
import MapKit

class HJLocationAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var index:Int?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle:String) {
        
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}

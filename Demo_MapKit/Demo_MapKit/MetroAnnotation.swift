//
//  MetroAnnotation.swift
//  Demo_MapKit
//
//  Created by Mobile6 on 2/27/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//

import UIKit
import MapKit

class MetroAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle:String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}
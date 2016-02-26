//
//  MapViewController.h
//  Carros
//
//  Created by Ricardo Lecheta on 9/26/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Carro.h"

@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

// Para ler a Latitude e Longitude
@property (nonatomic, retain) Carro *carro;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@property (nonatomic, retain) CLLocationManager *locationManager;

@end

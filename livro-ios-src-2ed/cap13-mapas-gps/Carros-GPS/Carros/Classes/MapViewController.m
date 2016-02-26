//
//  MapViewController.m
//  Carros
//
//  Created by Ricardo Lecheta on 9/26/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "MapViewController.h"

@implementation MapViewController

@synthesize mapView = _mapView;
@synthesize carro;
@synthesize locationManager;

#pragma mark View LifeCycle
- (void)viewDidLoad {
	self.title = carro.nome;

	// Cria uma coordenada
	MKCoordinateRegion coordenada;
	coordenada.center.latitude = [self.carro.latitude doubleValue];
	coordenada.center.longitude = [self.carro.longitude doubleValue];
    NSLog(@"Carro %f %f", coordenada.center.latitude, coordenada.center.longitude);

    coordenada.center.latitude  = 44.532218;
    coordenada.center.longitude = 10.864019;
    
    

	// Centraliza o mapa nesta coordenada
	[self.mapView setRegion:coordenada animated:YES];

	// Configura o modo satélite
	[self.mapView setMapType:MKMapTypeSatellite];

	// Adiciona o marcador no mapa
	MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
	[pin setCoordinate:coordenada.center];
	[pin setTitle:[NSString stringWithFormat:@"Fábrica %@", self.carro.nome]];
	[self.mapView addAnnotation:pin];

    // Delegate
	self.mapView.delegate = self;
}

#pragma mark GPS Liga Desliga
// Sempre que exibir a tela liga o GPS
- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	// Inicia o LocationManager para monitora as coordenadas GPS
	self.locationManager = [[CLLocationManager alloc] init];
	self.locationManager.delegate = self;
//	self.locationManager.distanceFilter = 100.00;
//	self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
	// Começa a monitorar o GPS
	[self.locationManager startUpdatingLocation];
}
// Ao sair da tela desliga
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
	// Desliga o monitoramento do GPS
	[self.locationManager stopUpdatingLocation];
}

#pragma mark MKMapViewDelegate
- (MKAnnotationView *)mapView:(MKMapView *)mapView
            viewForAnnotation:(id <MKAnnotation>)annotation {
	MKPinAnnotationView *pinView = (MKPinAnnotationView *)
	[mapView dequeueReusableAnnotationViewWithIdentifier:@"pinView"];
	if (!pinView) {
		// Cria a view
		pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                  reuseIdentifier:@"pinView"];
		pinView.pinColor = MKPinAnnotationColorRed;
		pinView.animatesDrop = YES;
		pinView.canShowCallout = YES;
		UIButton *btPin = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
		pinView.rightCalloutAccessoryView = btPin;
	} else {
		// Existe no cache, vamos reaproveitar
		pinView.annotation = annotation;
	}
	// Retorna a view que será exibida ao usuário
	return pinView;
}
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view
calloutAccessoryControlTapped:(UIControl *)control {
	// Clicou no botão da view
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"MapView" message:@"Opa!"
                                                   delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
	[alert show];
}

#pragma mark GPS - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
	NSLog(@"Location: %@", [newLocation description]);
	//CLLocationDistance altitude = newLocation.altitude;
	CLLocationDegrees latitude = newLocation.coordinate.latitude;
	CLLocationDegrees longitude = newLocation.coordinate.longitude;
    NSLog(@"Lat %f Lng %f", latitude, longitude);

	// Cria um MKCoordinateRegion necessario para exibir a localizacao no mapa
    MKCoordinateRegion coordenada;
    coordenada.center = newLocation.coordinate;
    MKCoordinateSpan span;
    span.latitudeDelta=0.01;
    span.longitudeDelta=0.01;
    coordenada.span=span;

	// Centraliza o mapa nesta coordenada
	[self.mapView setRegion:coordenada animated:YES];
    
    
}
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
	NSLog(@"locationManager.didFailWithError: %@", [error description]);
}

@end

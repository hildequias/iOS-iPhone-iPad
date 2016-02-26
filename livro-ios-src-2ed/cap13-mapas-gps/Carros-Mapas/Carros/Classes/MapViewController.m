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

#pragma mark View LifeCycle
- (void)viewDidLoad {
	self.title = carro.nome;

	// Cria uma coordenada
	MKCoordinateRegion coordenada;
	coordenada.center.latitude = [self.carro.latitude doubleValue];
	coordenada.center.longitude = [self.carro.longitude doubleValue];

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
    
    // Descomente para abrir o mapa com a rota
//    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"https://maps.google.com/maps?saddr=-22.967482,-43.178802&daddr=-22.951915,-43.21056"]];
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

@end

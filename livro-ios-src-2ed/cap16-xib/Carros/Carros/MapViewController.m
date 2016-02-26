//
//  MapViewController.m
//  Carros
//
//  Created by Ricardo Lecheta on 8/28/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

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
    
    // Centraliza o mapa nesta coordenada
    [self.mapView setRegion:coordenada animated:YES];
    
    // Configura o modo satélite
    [self.mapView setMapType:MKMapTypeSatellite];
    
    // Adiciona o marcador no mapa
    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init] ;
    [pin setCoordinate:coordenada.center];
    [pin setTitle:[NSString stringWithFormat:@"Fábrica %@", self.carro.nome]];
    [self.mapView addAnnotation:pin];
    
    // Delegate
    self.mapView.delegate = self;
    
    // Abre a URL no aplicativo nativo
    //NSString *url = @"https://maps.google.com/maps?saddr=-22.967482,-43.178802&daddr=-22.951915,-43.21056";
    //[[UIApplication sharedApplication] openURL: [NSURL URLWithString:url]];
}

// Sempre que exibir a tela liga o GPS
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // Inicia o LocationManager para monitora as coordenadas GPS
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = 100.00;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    // Começa a monitorar o GPS
    //[self.locationManager startUpdatingLocation];
}
// Ao sair da tela desliga
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    // Desliga o monitoramento do GPS
    [self.locationManager stopUpdatingLocation];
}

#pragma mark GPS
#pragma mark CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"Location: %@", [newLocation description]);
    
    CLLocationDistance distancia = [newLocation distanceFromLocation:oldLocation];
    NSLog(@"Distância em metros: %f", distancia);
    
   // CLLocationDistance altitude = newLocation.altitude;
    CLLocationDegrees latitude = newLocation.coordinate.latitude;
    CLLocationDegrees longitude = newLocation.coordinate.longitude;
    // Cria um MKCoordinateRegion necessario para exibir a localizacao no mapa
    MKCoordinateRegion coordenada = {{0.0,0.0}, {0.0,0.0}};
    coordenada.center.latitude = latitude;
    coordenada.center.longitude = longitude;
    // Centraliza o mapa nesta coordenada
    [self.mapView setRegion:coordenada animated:YES];
}
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    NSLog(@"Error: %@", [error description]);
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
//    [alert release];
}

@end

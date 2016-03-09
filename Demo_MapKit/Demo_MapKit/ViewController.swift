//
//  ViewController.swift
//  Demo_MapKit
//
//  Created by Mobile6 on 2/27/16.
//  Copyright © 2016 Pixonsoft. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var mapKit: MKMapView!
    
    var locationManager:CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.locationManager.requestWhenInUseAuthorization()
        
//        let fiapLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-23.573978, -46.623272)
        let fiapLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-23.589541, -46.634701)
        
        
//        MKCoordinateRegionMakeWithDistance(centerCoordinate:CLLocationCoordinate2D,
//                                            latitudinalMeters:CLLocationDistance,
//                                            longitudinalMeters: CLLocationDistance)
        
        self.mapKit.region = MKCoordinateRegionMakeWithDistance(fiapLocation, 1200, 1200)
        
        let ibiraAnnotation:MKPointAnnotation = MKPointAnnotation()
        ibiraAnnotation.coordinate = CLLocationCoordinate2DMake(-23.587416, -46.657634)
        ibiraAnnotation.title = "Parque do Ibirapuera"
        
        let fiapAnnotation:MKPointAnnotation = MKPointAnnotation()
        fiapAnnotation.coordinate = CLLocationCoordinate2DMake(-23.573978, -46.623272)
        fiapAnnotation.title = "FIAP"
        fiapAnnotation.subtitle = "FIAP centro de excelência em tecnologia."
        
        let metroLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(-23.589541, -46.634701)
        
        //criar anotaçao customizada para a FIAP
        let metroAnnotation = MetroAnnotation(coordinate: metroLocation,
                                                title: "Metrô Vila Mariana",
                                                subtitle: "Linha Azul")
        
        self.mapKit.addAnnotations([ibiraAnnotation, fiapAnnotation, metroAnnotation])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segmentedValueChanged(sender: UISegmentedControl) {
        
        
        
        switch (sender.selectedSegmentIndex) {
            case 0:
                mapKit.mapType = MKMapType.Standard
                break;
            
            case 1:
                mapKit.mapType = MKMapType.Satellite
                break;
            
            case 2:
                mapKit.mapType = MKMapType.Hybrid
                break;

            default:
                break;
        }
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView?{
        
        if annotation is MetroAnnotation {
            
            //verificar se a marcação já existe para tentar reutilizá-la
            let reuseId = "reuseMetroAnnotation"
            var anView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
            
            //se a view não existir
            if anView == nil {
                
                //criar a view como subclasse de MKAnnotationView
                anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
                //trocar a imagem pelo logo do Metro
                anView!.image = UIImage(named:"metroLogo")
                //permitir que mostre o "balão" com informações da marcação
                anView!.canShowCallout = true
                //adiciona um botão do lado direito do balão
                anView!.rightCalloutAccessoryView = UIButton(type: UIButtonType.DetailDisclosure)
            }
            return anView
        }
        
        if (annotation is MKUserLocation) {
            
            //verificar se a marcação já existe para tentar reutilizá-la
            let reuseId = "reuseMyLocation"
            var anView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
            
            //se a view não existir
            if (anView == nil) {
                //criar a view como subclasse de MKAnnotationView
                anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
                //trocar a imagem pelo logo do metro
                anView!.image = UIImage(named:"userLogo")
                //permitir que mostre o "balão" com informações da marcação 
                anView!.canShowCallout = false
            }
            return anView
        }
        
        return nil
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let url:NSURL = NSURL(string: "http:/www.metro.sp.gov.br")!
        UIApplication.sharedApplication().openURL(url)
        
        print(view.annotation?.title)
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = "restaurantes"
        
        request.region = self.mapKit.region
        var search = MKLocalSearch(request: request)
        
        //inicia a busca
        search.startWithCompletionHandler { (response, error) -> Void in
            if (error == nil) {
                //cria um array para guardar os resultados retornados
                var placemarks: [MKPointAnnotation] = []
                
                for item: MKMapItem in response!.mapItems {
                    //cria uma nova marcação por resultado
                    let place = MKPointAnnotation()
                    place.coordinate = item.placemark.coordinate
                    place.title = item.name
                    placemarks.append(place)
                }
                
                //limpa todas as anotacoes anteriores para adicionar as novas 
                self.mapKit.removeAnnotations(self.mapKit.annotations)
                self.mapKit.addAnnotations(placemarks)
            }
        }
    }

}


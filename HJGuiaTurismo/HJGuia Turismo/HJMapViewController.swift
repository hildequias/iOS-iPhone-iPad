//
//  HJMapViewController.swift
//  HJGuia Turismo
//
//  Created by Usuário Convidado on 12/03/16.
//  Copyright © 2016 pixonsoft. All rights reserved.
//

import UIKit
import MapKit

class HJMapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    var locationManager:CLLocationManager = CLLocationManager()
    var session: NSURLSession?
    var locations = [HJLocationVO]()
    
    let url = NSURL (string:"http://flameworks.com.br/fiap/pontosTuristicos.txt")! // URL de acesso
    
    //    MARK: - ViewController Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let annotation:HJLocationAnnotation = sender as? HJLocationAnnotation {
            let detail:HJDetailViewController = segue.destinationViewController as! HJDetailViewController
            detail.location = locations[annotation.index!] 
        }
    }
    
    //    MARK: - Delegates Map
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView?{
        
        //verificar se a marcação já existe para tentar reutilizá-la
        let reuseId = "reuseAnnotation"
        var anView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
        
        //se a view não existir
        if anView == nil {
            
            //criar a view como subclasse de MKAnnotationView
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            //trocar a imagem pelo logo azul
            anView!.image = UIImage(named:"bluePin")
            //permitir que mostre o "balão" com informações da marcação
            anView!.canShowCallout = true
            //adiciona um botão do lado direito do balão
            anView!.rightCalloutAccessoryView = UIButton(type: UIButtonType.DetailDisclosure)
        }
        return anView
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        print(view.annotation?.title)
        self.performSegueWithIdentifier("goDetail", sender: view.annotation)
        
    }
    
    //    MARK: - Methodos
    func getData(){
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        session = NSURLSession(configuration: sessionConfig)
        
        let task = session!.dataTaskWithURL(url,
            completionHandler: {(data: NSData?, response:NSURLResponse?, error: NSError?) -> Void in
                
                //ações efetuadas quando a execução da task se completa
                if (error == nil) {
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        
                        self.getLocations(data!)
                    })
                }
        })
        
        
        // Disparo da execucao da task
        task.resume()
    }
    
    func getLocations(data: NSData) {
        
        do {
            
            let locationsData = try NSJSONSerialization.JSONObjectWithData(data , options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            
            if let locationsData = locationsData["locais"] as? NSArray {
                
                var index:Int = 0
                
                for location in locationsData{
                    
                    let location = HJLocationVO(data: location as! NSDictionary)
                    location.index = index
                    locations.append(location)
                    index += 1
                }
                self.createAnnotationsInMap()
            }
            
        }catch {
            print("Erro no parser JSON")
        }
    }
    
    func createAnnotationsInMap(){
        
        self.locationManager.requestWhenInUseAuthorization()
        
        let seLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-23.550303, -46.634184)
        self.map.region = MKCoordinateRegionMakeWithDistance(seLocation, 12000, 12000)
        
        for location in locations{
            
            let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.lat, location.log)
            
            //criar anotaçao customizada
            let locationAnnotation = HJLocationAnnotation(coordinate: coordinate,
                        title: location.name,
                        subtitle: location.address)
            locationAnnotation.index = location.index
            self.map.addAnnotation(locationAnnotation)
        }
    }

}


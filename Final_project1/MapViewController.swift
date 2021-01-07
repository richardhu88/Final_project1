//
//  MapViewController.swift
//  Final_project1
//
//  Created by 胡嘉樺 on 2021/1/5.
//

import UIKit
//import GoogleMaps
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

//    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var mapView: MKMapView!
    
    @objc func buttonPress(_ sender:UIButton){
        if sender.tag == 100{
            
            self.performSegue(withIdentifier: "goscan", sender: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let anns = [MKPointAnnotation(), MKPointAnnotation()]
        anns[0].coordinate = CLLocationCoordinate2D(latitude: 24.137426, longitude: 121.275753)
        anns[0].title = "武嶺"
        anns[0].subtitle = "南投縣仁愛鄉"
       
        
        
        anns[1].coordinate = CLLocationCoordinate2D(latitude: 23.898087806604437,  longitude: 121.54182325767071)
        anns[1].title = "東華大學"
        anns[1].subtitle = "花蓮縣壽豐鄉"
        
        
        mapView.addAnnotations(anns)
        
        mapView.setCenter(anns[0].coordinate, animated: false)

 
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation)else{
            return nil
        }
        
        var annView = mapView.dequeueReusableAnnotationView(withIdentifier: "pin")as? MKPinAnnotationView
        if annView == nil{
            annView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        }
        
        
        
        
        if(annotation.title)! == "武嶺"{
            annView!.pinTintColor = UIColor.green
            let label = UILabel()
            label.text = "掃描QRCode"
            annView?.detailCalloutAccessoryView = label
            
            let button = UIButton(type: .detailDisclosure)
            button.tag = 100
            button.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
            annView?.rightCalloutAccessoryView = button
            
        }
        else if (annotation.title)! == "東華大學"{
            annView?.pinTintColor = UIColor.blue
        }
        
        annView!.canShowCallout = true
        
        return annView
        
        
    }

    
    
    
    
    
    
    
    
    
    
    /*
     // Do any additional setup after loading the view.
//        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 15.0)
//        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
//        self.view.addSubview(mapView)
//
//        // Creates a marker in the center of the map.
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = mapView
    */

}

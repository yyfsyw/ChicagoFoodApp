//
//  MapUIViewController.swift
//  ChicagoFoodApp
//
//  Created by Michael Tompkins on 5/3/17.
//  Copyright © 2017 YUNFEI YANG. All rights reserved.
//

import UIKit
import MapKit

class MapUIViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!

    var facilities: [Facility] = []
    
    class customMKPointAnnotation: MKPointAnnotation {
        var image: UIImage? = UIImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        mapView.showsUserLocation = true
        
        Model.sharedInstance.loadData()
        facilities = Model.sharedInstance.fetchFacilities()
        //let center = CLLocationCoordinate2D(latitude: 41.8781136, longitude: -87.62979819999998)
        //let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        //mapView.region = MKCoordinateRegion(center: center, span: span)
        
        print(facilities.count)
        
        print("-------------------")
        for facility in facilities {
            print(facility.address ?? "")
            print(facility.longitude )
            print(facility.latitude )
            print(facility.risk ?? 0)
        }
        
        for facility in facilities{
            let annotation = customMKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: facility.latitude, longitude: facility.longitude)
            annotation.title = facility.name
            annotation.subtitle = facility.address
            if((facility.risk?.compare(1)) != nil){
                print("I'm in risk 1")
                annotation.image = UIImage(named: "risk1Annotation")
            }else if((facility.risk?.compare(2)) != nil){
                print("I'm in risk 2")
                annotation.image = UIImage(named: "risk2Annotation")
            }else if((facility.risk?.compare(3)) != nil){
                print("I'm in risk 3")
                annotation.image = UIImage(named: "risk3Annotation")
            }else{
                print("I'm not in  risk ")
                annotation.image = UIImage(named: "risk2Annotation")
            }
            mapView.addAnnotation(annotation)
            print("Made Annotation")
        }
        
        
    }
    
    /* Centers Map on Your Location */
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let region = MKCoordinateRegion(center: self.mapView.userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        mapView.setRegion(region, animated: true)
    }
    
    /* Makes Custom Annotations */
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if !(annotation is MKPointAnnotation){
            print("Not registered as MKPointAnnotation")
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "reusableAnnotation")
        if (annotationView == nil){
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "reusableAnnotation")
            annotationView?.canShowCallout = true
        }
        else{
            annotationView?.annotation = annotation
        }
        
        /* Custom Pin Point */
        let cpa = annotation as! customMKPointAnnotation
        annotationView!.image = cpa.image
        
        /* Right accessory view */
        let image = UIImage(named: "infoIcon")
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.setImage(image, for: UIControlState())
        annotationView?.rightCalloutAccessoryView = button
        
        return annotationView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

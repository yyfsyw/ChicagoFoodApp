//
//  MapUIViewController.swift
//  ChicagoFoodApp
//
//  Created by Michael Tompkins on 5/9/17.
//  Copyright © 2017 YUNFEI YANG. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapUIViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    let manager = CLLocationManager()
    
    var facilities: [Facility] = []
    var destination: CLLocationCoordinate2D? = nil
    
    let testing: ViewController = ViewController()
    
    class customMKPointAnnotation: MKPointAnnotation {
        var image: UIImage? = UIImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Model.sharedInstance.loadData()
        facilities = Model.sharedInstance.fetchFacilities()
        
        self.mapView.delegate = self
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
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
            if(facility.risk == 1){
                annotation.image = UIImage(named: "risk1Annotation")
            }else if(facility.risk == 2){
                annotation.image = UIImage(named: "risk2Annotation")
            }else if(facility.risk == 3){
                annotation.image = UIImage(named: "risk3Annotatin")
            }else{
                annotation.image = UIImage(named: "risk3Annotatin")
            }
            mapView.addAnnotation(annotation)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        manager.stopUpdatingLocation()
        
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region = MKCoordinateRegionMake(myLocation, span)
        
        mapView.setRegion(region, animated: true)
        
        self.mapView.showsUserLocation = true
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
        annotationView?.calloutOffset = CGPoint(x: -5, y: 5)
        annotationView?.rightCalloutAccessoryView = UIButton.init(type: .detailDisclosure) as UIView
        
        return annotationView
    }
    
    /* This is What Happens When The I is Pushed in the Annotation */
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
    }
    
    func getDirections(){
        print(destination!)
        
        let overlays = mapView.overlays
        mapView.removeOverlays(overlays)
        
        let request = MKDirectionsRequest()
        let newDestination = MKPlacemark.init(coordinate: destination!)
        request.source = MKMapItem.forCurrentLocation()
        request.destination = MKMapItem.init(placemark: newDestination)
        request.requestsAlternateRoutes = false
        
        let directions = MKDirections(request: request)
        
        directions.calculate(completionHandler: {(response, error) in
            
            if error != nil {
                print("Error getting directions")
            } else {
                self.showRoute(response!)
            }
        })
    }
    
    func showRoute(_ response: MKDirectionsResponse) {
        
        for route in response.routes {
            
            mapView.add(route.polyline,
                        level: MKOverlayLevel.aboveRoads)
            for step in route.steps {
                print(step.instructions)
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor
        overlay: MKOverlay) -> MKOverlayRenderer {
        
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 5.0
        return renderer
    }
    
    @IBAction func refreshMapCenter(_ sender: UILongPressGestureRecognizer) {
        manager.startUpdatingLocation()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}


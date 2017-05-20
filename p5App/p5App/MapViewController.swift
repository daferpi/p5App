//
//  MapViewController.swift
//  p5App
//
//  Created by Abel Fernandez on 20/05/2017.
//  Copyright © 2017 Daferpi. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    var childrenList:[Schoolchild]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        self.mapView.showsUserLocation = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let childrenList = childrenList {
            
            let annotationsList:[MKPointAnnotation] = childrenList.map({ (child) -> MKPointAnnotation in
                let annotation:ChildPointAnnotation = ChildPointAnnotation()
                annotation.coordinate = child.location
                annotation.title = child.name
                annotation.subtitle = child.littleDescription
                annotation.photoImage = child.photo
                return annotation
            })
            
            self.mapView.addAnnotations(annotationsList)
            self.mapView.showAnnotations(annotationsList, animated: true)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseIdentifier = "pin"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        
        let customPointAnnotation = annotation as! ChildPointAnnotation
        annotationView?.image = customPointAnnotation.photoImage
        
        return annotationView
    }
    
}

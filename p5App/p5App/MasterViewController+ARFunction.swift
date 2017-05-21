//
//  MasterViewController+ARFunction.swift
//  p5App
//
//  Created by Abel Fernandez on 21/05/2017.
//  Copyright © 2017 Daferpi. All rights reserved.
//

import UIKit
import HDAugmentedReality
import MapKit

extension MasterViewController:ARDataSource {
    
    func showARController() {
        self.arVC = ARViewController()
        self.arVC.dataSource = self
        
        self.arVC.presenter.distanceOffsetMultiplier = 0.1   // Pixels per meter
        self.arVC.presenter.distanceOffsetMinThreshold = 500 // Doesn't raise annotations that are nearer than this
        // Filtering for performance
        self.arVC.presenter.maxDistance = 3000               // Don't show annotations if they are farther than this
        self.arVC.presenter.maxVisibleAnnotations = 100      // Max number of annotations on the screen
        // Stacking
        self.arVC.presenter.verticalStackingEnabled = true
        // Location precision
        self.arVC.trackingManager.userDistanceFilter = 15
        self.arVC.trackingManager.reloadDistanceFilter = 50
        
        // Interface orientation
        self.arVC.interfaceOrientationMask = .all
        
        self.arVC.onDidFailToFindLocation =
            {
                [weak self, weak arVC] elapsedSeconds, acquiredLocationBefore in
                
                self?.handleLocationFailure(elapsedSeconds: elapsedSeconds, acquiredLocationBefore: acquiredLocationBefore, arViewController: arVC)
        }
        // Setting annotations
        var counter = 0
        let annotations = self.childList.map { (schoolchild) -> ARAnnotation in
            let location = CLLocation(latitude: schoolchild.location.latitude, longitude: schoolchild.location.longitude)
            let annotation = ARAnnotation(identifier: "\(counter)", title: schoolchild.name, location: location)
            counter += 1
            return annotation!
        }
        self.arVC.setAnnotations(annotations)
        // Presenting controller
        self.present(self.arVC, animated: true, completion: nil)
        
    }
    
    func ar(_ arViewController: ARViewController, viewForAnnotation: ARAnnotation) -> ARAnnotationView {
        // Annotation views should be lightweight views, try to avoid xibs and autolayout all together.
        let annotationView = ChildARAnnotationView()
        
        if let identifier = viewForAnnotation.identifier {
            let index = Int(identifier)
            let child = self.childList[index!]
            annotationView.image = child.photo
            annotationView.littleDescription = child.littleDescription
        }
        
        annotationView.frame = CGRect(x: 0,y: 0,width: 150,height: 70)
        return annotationView;
    }
    
    func handleLocationFailure(elapsedSeconds: TimeInterval, acquiredLocationBefore: Bool, arViewController: ARViewController?)
    {
        guard let arViewController = arViewController else { return }
        guard !Platform.isSimulator else { return }
        NSLog("Failed to find location after: \(elapsedSeconds) seconds, acquiredLocationBefore: \(acquiredLocationBefore)")
        
        // Example of handling location failure
        if elapsedSeconds >= 20 && !acquiredLocationBefore
        {
            // Stopped bcs we don't want multiple alerts
            arViewController.trackingManager.stopTracking()
            
            let alert = UIAlertController(title: "Problems", message: "Cannot find location, use Wi-Fi if possible!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Close", style: .cancel)
            {
                (action) in
                
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(okAction)
            
            self.presentedViewController?.present(alert, animated: true, completion: nil)
        }
    }
}

//
//  DetailViewController.swift
//  p5App
//
//  Created by Abel Fernandez on 20/05/2017.
//  Copyright © 2017 Daferpi. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {

    
    @IBOutlet var photoImg: UIImageView!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var descLbl: UILabel!
    @IBOutlet var mapView: MKMapView!
    
    var detailItem: Schoolchild?


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            self.nameLbl.text = detail.name
            self.descLbl.text = detail.littleDescription
            self.photoImg.image = detail.photo
            self.photoImg.layer.cornerRadius = self.photoImg.frame.height / 2
            self.photoImg.layer.masksToBounds = true
            
            let annotation:MKPointAnnotation = MKPointAnnotation()
            annotation.coordinate = detail.location
            annotation.title = detail.name
            annotation.subtitle = detail.littleDescription
            self.mapView.addAnnotation(annotation)
            self.mapView.showAnnotations([annotation], animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    


}


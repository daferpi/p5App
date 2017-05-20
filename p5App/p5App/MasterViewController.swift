//
//  MasterViewController.swift
//  p5App
//
//  Created by Abel Fernandez on 20/05/2017.
//  Copyright © 2017 Daferpi. All rights reserved.
//

import UIKit
import CoreLocation

struct Schoolchild {
    let name:String
    let littleDescription:String
    let photo:UIImage
    let location:CLLocationCoordinate2D
    
    
    init(name:String, littleDescription:String, photo:UIImage, location:CLLocationCoordinate2D) {
        self.name = name
        self.littleDescription = littleDescription
        self.photo = photo
        self.location = location
    }
}

class MasterViewController: UITableViewController {

    let locationManager = CLLocationManager()
    var detailViewController: DetailViewController? = nil
    var childList:[Schoolchild] = [Schoolchild(name: "Alexa", littleDescription: "Le gustan los animales y los deportees", photo: UIImage(named: "alexa")!, location: CLLocationCoordinate2D(latitude: 41.407637, longitude: 2.188162 )),
                                   Schoolchild(name: "Carla", littleDescription: "Le gusta pasear e ir a la playa", photo: UIImage(named: "carla")!, location: CLLocationCoordinate2D(latitude: 41.404394, longitude: 2.190630 )),
                                   Schoolchild(name: "Cristian", littleDescription: "Le el monopatin y el surf", photo: UIImage(named: "cristian")!, location: CLLocationCoordinate2D(latitude: 41.404220, longitude: 2.214159 )),
                                   Schoolchild(name: "Gen", littleDescription: "Le gusta ir de compras y la fiesta", photo: UIImage(named: "gen")!, location: CLLocationCoordinate2D(latitude: 41.408927, longitude: 2.215618 )),
                                   Schoolchild(name: "Jose", littleDescription: "Le gusta la montaña y los helados", photo: UIImage(named: "jose")!, location: CLLocationCoordinate2D(latitude: 41.409321, longitude: 2.210393 ))]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        self.locationManager.requestAlwaysAuthorization()
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = childList[indexPath.row] 
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! AlumnoTableViewCell

        let object = childList[indexPath.row]
        cell.nameLbl.text = object.name
        cell.descLbl.text = object.littleDescription
        cell.photoImg.image = object.photo
        cell.photoImg.layer.cornerRadius = cell.photoImg.frame.height / 2
        cell.photoImg.layer.masksToBounds = true
        return cell
    }

}


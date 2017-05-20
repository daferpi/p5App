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
    var childList:[Schoolchild] = [Schoolchild(name: "Adria Castro", littleDescription: "Juega al futbol", photo: UIImage(named: "adria")!, location: CLLocationCoordinate2D(latitude: 41.401186, longitude: 2.205785 )),
                                   Schoolchild(name: "Alba Pallardo", littleDescription: "Juega a las supernenas", photo: UIImage(named: "alba")!, location: CLLocationCoordinate2D(latitude: 41.402844, longitude: 2.212845 )),
                                   Schoolchild(name: "Alba Feliu", littleDescription: "Juega al tobogan", photo: UIImage(named: "albafeliu")!, location: CLLocationCoordinate2D(latitude: 41.406763, longitude: 2.215120 )),
                                   Schoolchild(name: "Aleix Artero", littleDescription: "Está en el tranvia", photo: UIImage(named: "aleix")!, location: CLLocationCoordinate2D(latitude: 41.409418, longitude: 2.211075 )),
                                   Schoolchild(name: "Alex Cristobal", littleDescription: "Juega con la bicicleta", photo: UIImage(named: "alexcristobal")!, location: CLLocationCoordinate2D(latitude: 41.409321, longitude: 2.210393 )),
                                   
                                   Schoolchild(name: "Alex Cristobal", littleDescription: "Juega al monopatín", photo: UIImage(named: "alexcristobal")!, location: CLLocationCoordinate2D(latitude: 41.409321, longitude: 2.210393 )),
                                   
                                   Schoolchild(name: "Anna Casanovas", littleDescription: "Está dando un paseo", photo: UIImage(named: "anacasanovas")!, location: CLLocationCoordinate2D(latitude: 41.411800, longitude: 2.204180 )),
                                   
                                   Schoolchild(name: "Bruno Carle", littleDescription: "Está tomando un helado", photo: UIImage(named: "brunocarle")!, location: CLLocationCoordinate2D(latitude: 41.402531, longitude: 2.208346 )),
                                   
                                   Schoolchild(name: "Clara López", littleDescription: "Está jugando en el columpio", photo: UIImage(named: "clara")!, location: CLLocationCoordinate2D(latitude: 41.406571, longitude: 2.214880 )),
                                   
                                   Schoolchild(name: "Clàudia Galan", littleDescription: "Está comprando fruta", photo: UIImage(named: "claudia")!, location: CLLocationCoordinate2D(latitude: 41.412960, longitude: 2.212616 )),
                                   
                                   Schoolchild(name: "Dauphine Perrot", littleDescription: "Está jugando en la arena de la playa", photo: UIImage(named: "dauphin")!, location: CLLocationCoordinate2D(latitude: 41.405509, longitude: 2.219236)),
                                   
                                   Schoolchild(name: "Diego Gavilán", littleDescription: "Está jugando en el Saltin", photo: UIImage(named: "diegogavilan")!, location: CLLocationCoordinate2D(latitude: 41.412156, longitude: 2.201051)),
                                   
                                   Schoolchild(name: "Diego Martín", littleDescription: "Está jugando tomando un zumo", photo: UIImage(named: "diegomartin")!, location: CLLocationCoordinate2D(latitude: 41.417024, longitude: 2.208658)),
                                   
                                   Schoolchild(name: "Èric Gimenéz", littleDescription: "Está buscando un juguete perdido", photo: UIImage(named: "eric")!, location: CLLocationCoordinate2D(latitude: 41.418963, longitude: 2.202779)),
                                   
                                   Schoolchild(name: "Helena García", littleDescription: "Ha ido a la peluquería con su mama", photo: UIImage(named: "helena")!, location: CLLocationCoordinate2D(latitude: 41.409917, longitude: 2.193926)),
                                   
                                   Schoolchild(name: "Júlia Guimaré", littleDescription: "Está comprando flores", photo: UIImage(named: "julia")!, location: CLLocationCoordinate2D(latitude: 41.409599, longitude: 2.217799)),
                                   
                                   Schoolchild(name: "Laura Balagué", littleDescription: "Está jugando con su prima", photo: UIImage(named: "laurabalague")!, location: CLLocationCoordinate2D(latitude: 41.407275, longitude: 2.201856)),
                                   
                                   Schoolchild(name: "Lucía Durán", littleDescription: "Está en una fiesta de cumpleaños", photo: UIImage(named: "luciaduran")!, location: CLLocationCoordinate2D(latitude: 41.406462, longitude: 2.196513)),
        
                                   Schoolchild(name: "Nagore Heredia", littleDescription: "Está de visita en el zoo", photo: UIImage(named: "nagore")!, location: CLLocationCoordinate2D(latitude: 41.406462, longitude: 2.196513)),
                                   
                                   Schoolchild(name: "Noa Fernández", littleDescription: "Ha ido a la biblioteca", photo: UIImage(named: "noa")!, location: CLLocationCoordinate2D(latitude: 41.406462, longitude: 2.196513)),
                                   
                                   Schoolchild(name: "Ona Calvo", littleDescription: "Está pintando con tiza en el parque", photo: UIImage(named: "ona")!, location: CLLocationCoordinate2D(latitude: 41.405679, longitude: 2.216681)),
                                   
                                   Schoolchild(name: "Paula Rodríguez", littleDescription: "Se ha ido a comprar cromos", photo: UIImage(named: "paula")!, location: CLLocationCoordinate2D(latitude: 41.406305, longitude: 2.208900)),
                                   
                                   Schoolchild(name: "Raúl Hernández", littleDescription: "Está jugando al baloncesto", photo: UIImage(named: "raul")!, location: CLLocationCoordinate2D(latitude: 41.410684, longitude: 2.210156)),
                                   
                                   Schoolchild(name: "Sara Fernández", littleDescription: "Está bailando Valet", photo: UIImage(named: "sarafernandez")!, location: CLLocationCoordinate2D(latitude: 41.405228, longitude: 2.211486)),
                                   
                                   Schoolchild(name: "Sara Sampietro", littleDescription: "Está haciendo teatro", photo: UIImage(named: "sarasampietro")!, location: CLLocationCoordinate2D(latitude: 41.406823, longitude: 2.203936)),
                                   
                                   Schoolchild(name: "Sofía Martínez", littleDescription: "Se ha ido al cine", photo: UIImage(named: "sofia")!, location: CLLocationCoordinate2D(latitude: 41.405139, longitude: 2.191428)),
                                   
                                   Schoolchild(name: "Xavier Torelló", littleDescription: "Juega con la videoconsola", photo: UIImage(named: "xaviertorello")!, location: CLLocationCoordinate2D(latitude: 41.414919, longitude: 2.211650)),
                                   
                                   
                                   
                                   ]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:#selector(mapButtonClicked(_:)))
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
    
    func mapButtonClicked(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "mapDetail", sender: sender)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = childList[indexPath.row] 
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        } else if segue.identifier == "mapDetail" {
            let controller = (segue.destination as! UINavigationController).topViewController as! MapViewController
            controller.childrenList = self.childList
            controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
            controller.navigationItem.leftItemsSupplementBackButton = true
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


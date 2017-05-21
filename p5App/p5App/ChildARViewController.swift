//
//  ChildARViewController.swift
//  p5App
//
//  Created by Abel Fernandez on 21/05/2017.
//  Copyright © 2017 Daferpi. All rights reserved.
//

import UIKit
import PRAugmentedReality

class ChildARViewController: UIViewController, PRARManagerDelegate {
    
    var childrenList:[Schoolchild]?
    var childDictionaryDataList:[[String:Any]] = [[:]]
    var manager:PRARManager!
    var locationManager:CLLocationManager!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.childDictionaryDataList = self.createDictionaryDataList()
        self.manager = PRARManager.sharedManager(withRadarAndSize: self.view.frame.size, andDelegate: self) as! PRARManager
        self.locationManager = CLLocationManager()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        let location = CLLocationCoordinate2DMake(41.405146, 2.211403)
        let location = self.locationManager.location?.coordinate
        if let location = location {
            self.manager.startAR(withData: childDictionaryDataList, forLocation: location)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func createDictionaryDataList() -> [[String:Any]] {
        var dataDictionaryList:[[String:Any]] = [[:]]
        if let childrenList = self.childrenList {
            var counter = 0
            dataDictionaryList = childrenList.map({ (schoolchild) -> [String:Any] in
                let dictionary:[String:Any] = ["id":counter, "lat":schoolchild.location.latitude,
                                               "lon": schoolchild.location.longitude, "title":schoolchild.name]
                
                counter = counter + 1
                return dictionary
            })
        }
        return dataDictionaryList
    }
    
    //MARK: - PRARManagerDelegate
    func prarDidSetupAR(_ arView: UIView!, withCameraLayer cameraLayer: AVCaptureVideoPreviewLayer!, andRadarView radar: UIView!) {
        self.view.layer.addSublayer(cameraLayer)
        self.view.addSubview(arView)
        
        self.view.bringSubview(toFront: self.view.viewWithTag(Int(AR_VIEW_TAG))!)
        
        self.view.addSubview(radar)
    }
    
    func prarUpdateFrame(_ arViewFrame: CGRect) {
        
        self.view.viewWithTag(Int(AR_VIEW_TAG))!.frame = arViewFrame
    }
    
    func prarGotProblem(_ problemTitle: String!, withDetails problemDetails: String!) {
        
        let alertViewError = UIAlertController(title: problemTitle, message: problemDetails, preferredStyle: .alert)
        self.present(alertViewError, animated: true, completion: nil)
    }

}

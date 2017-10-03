//
//  FormViewController.swift
//  cbe
//
//  Created by Victor Korir on 7/30/17.
//  Copyright © 2017 Victor Korir. All rights reserved.
//

import UIKit
import GoogleMaps
import FirebaseDatabase
import FirebaseAuth

class FormViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    let lat = 37.804363
    let lng = -122.271111
    let manager = CLLocationManager()
    var latitude: Double?
    var longitude: Double?
    var iSee: String = String()
    var iSmell: String = String()
    var iHear: String = String()
    var iFeel: String = String()
    var iSeeIntensity: Int = 0
    var iSmellIntensity: Int = 0
    var iHearIntensity: Int = 0
    var iFeelIntensity: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        latitude = manager.location?.coordinate.latitude
        longitude = manager.location?.coordinate.longitude
    }
    
//    FORM BUTTON ACTIONS
    
    @IBAction func iSeeDidSelect(_ sender: UIButton) {
        iSee = "I See " + Descriptions.see[sender.tag]
    }
    
    @IBAction func iSeeIntensityDidSelect(_ sender: UIButton) {
        iSeeIntensity = sender.tag
    }
    
    @IBAction func iSmellDidSelect(_ sender: UIButton) {
        iSmell = "I Smell " + Descriptions.smell[sender.tag]
    }
    
    @IBAction func iSmellIntensityDidSelect(_ sender: UIButton) {
        iSmellIntensity = sender.tag
    }
    
    @IBAction func iHearDidSelect(_ sender: UIButton) {
        iHear = "I Hear " + Descriptions.hear[sender.tag]
    }
    
    @IBAction func iHearIntensityDidSelect(_ sender: UIButton) {
        iHearIntensity = sender.tag
    }

    @IBAction func iFeelDidSelect(_ sender: UIButton) {
        iFeel = "I Feel " + Descriptions.feel[sender.tag]
    }
    
    @IBAction func iFeelIntensityDidSelect(_ sender: UIButton) {
        iFeelIntensity = sender.tag
    }
    
    @IBAction func cancelDidTouch(_ sender: Any) {
        performSegue(withIdentifier: Ids.reportToMain, sender: nil)
    }
    
    @IBAction func submitDidTouch(_ sender: Any) {
        let postRef = Database.database().reference(withPath: Path.Posts).childByAutoId()
        let user = Auth.auth().currentUser
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Config.dateFormat
        let time = dateFormatter.string(from: Date())
        let location = [Path.lat: latitude!, Path.lng: longitude!]
        let data:[String: AnyObject] = [
            Path.id: user?.uid as AnyObject,
            Path.time: time as AnyObject,
            Path.location: location as AnyObject,
            Path.see: [iSee, iSeeIntensity] as AnyObject,
            Path.smell: [iSmell, iSmellIntensity] as AnyObject,
            Path.hear: [iHear, iHearIntensity] as AnyObject,
            Path.feel: [iFeel, iFeelIntensity] as AnyObject
        ]
        postRef.setValue(data)
        
        let alert = UIAlertController(title: "Success!", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { action in
            self.performSegue(withIdentifier: Ids.reportToMain, sender: nil)
        }
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
}

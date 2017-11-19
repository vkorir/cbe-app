//
//  ViewController.swift
//  cbe
//
//  Created by Victor Korir on 7/13/17.
//  Copyright © 2017 Victor Korir. All rights reserved.
//

import UIKit
import GoogleMaps
import Firebase

class MainViewController: UIViewController, GMSMapViewDelegate {

    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var menuButton: UIButton!
    var lat = 37.804363
    var lng = -122.271111
    var postsRef = Database.database().reference(withPath: Path.Posts)
    var reports: [Report] = []
    var manager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
//        lat = (manager.location?.coordinate.latitude)!
//        lng = (manager.location?.coordinate.longitude)!
        
        
        if revealViewController() != nil {
            menuButton.addTarget(revealViewController(),
                                 action: #selector(SWRevealViewController.revealToggle(_:)),
                                 for: .touchUpInside)
            view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        }
        
        postsRef.observe(.childAdded, with: { snapshot in
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            let report = Report(id: dictionary[Path.id] as! String,
                                location: dictionary[Path.location] as! [String: Double],
                                timeString: dictionary[Path.time] as! String,
                                see: dictionary[Path.see] as! [AnyObject],
                                smell: dictionary[Path.smell] as! [AnyObject],
                                hear: dictionary[Path.hear] as! [AnyObject],
                                feel: dictionary[Path.feel] as! [AnyObject])
            self.reports.append(report)
            let desc = dictionary[Path.description] as! String
            let lat: Double = report.lat
            let lng: Double = report.lng
            self.locateOnMapWith(lng: lng, lat: lat, desc: desc)
        })
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lng, zoom: 10)
        mapView.camera = camera
        mapView.alpha = 1.0
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        
        //Firebase authorization listener
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locateOnMapWith(lng: Double, lat: Double, desc: String) {
        let position = CLLocationCoordinate2DMake(lat, lng)
        let marker = GMSMarker(position: position)
        marker.title = desc
        marker.infoWindowAnchor = CGPoint(x: 0.5, y: 0.5)
        marker.icon = GMSMarker.markerImage(with: UIColor.green)
        marker.map = self.mapView
    }
}


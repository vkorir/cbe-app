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
    let lat = 37.804363
    let lng = -122.271111
    var postsRef = Database.database().reference(withPath: Path.Posts)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lng, zoom: 14)
        mapView.camera = camera
        mapView.alpha = 0.5
        if revealViewController() != nil {
            menuButton.addTarget(revealViewController(),
                                 action: #selector(SWRevealViewController.revealToggle(_:)),
                                 for: .touchUpInside)
            view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        }
        
        //Firebase authorization listener
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


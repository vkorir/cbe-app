//
//  Report.swift
//  cbe
//
//  Created by Victor Korir on 8/13/17.
//  Copyright © 2017 Victor Korir. All rights reserved.
//

import Foundation
import GoogleMaps
import GooglePlaces

class Report {
    var id: String                      // uid of the user who posted
    var time: Date                      // The date that the report was submitted
    var see: [AnyObject]
    var smell: [AnyObject]
    var hear: [AnyObject]
    var feel: [AnyObject]
    var lat: Double
    var lng: Double
    
    init(id: String, location: [String: Double], timeString: String, see: [AnyObject], smell: [AnyObject], hear: [AnyObject], feel: [AnyObject]) {
        self.id = id
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Config.dateFormat
        self.time = dateFormatter.date(from: timeString)!
        self.see = see
        self.smell = smell
        self.hear = hear
        self.feel = feel
        self.lat = location[Path.lat]!
        self.lng = location[Path.lng]!
    }
    
    //  MARK
    func reverseGeocodeCoordinate() -> String {
        let coordinate: CLLocation = CLLocation(latitude: lat, longitude: lng)
        let geocoder = GMSGeocoder()
        var description: String = String()
        geocoder.reverseGeocodeCoordinate(coordinate.coordinate) { response, error in
            if let address = response?.firstResult() {
                let lines = address.lines as! [String]
                description = lines.joined(separator: "\n")
            }
        }
        return description
    }
    
    func getValue() -> Int {
        let see = self.see[1] as! Int
        let smell = self.smell[1] as! Int
        let hear = self.hear[1] as! Int
        let feel = self.feel[1] as! Int
        return Int((see + smell + hear + feel) / 4)
    }
    
    func getLat() -> Double {
        return lat
    }
    
    func getLng() -> Double {
        return lng
    }
}

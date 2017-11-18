//
//  Report.swift
//  cbe
//
//  Created by Victor Korir on 8/13/17.
//  Copyright © 2017 Victor Korir. All rights reserved.
//

import Foundation

class Report {
    var id: String                      // uid of the user who posted
    var location: [String: Double]      // location of the post
    var time: Date                      // The date that the report was submitted
    var see: [AnyObject]
    var smell: [AnyObject]
    var hear: [AnyObject]
    var feel: [AnyObject]
    
    init(id: String, location: [String: Double], timeString: String, see: [AnyObject], smell: [AnyObject], hear: [AnyObject], feel: [AnyObject]) {
        self.id = id
        self.location = location
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Config.dateFormat
        self.time = dateFormatter.date(from: timeString)!
        self.see = see
        self.smell = smell
        self.hear = hear
        self.feel = feel
    }
    
    func getValue() -> Int {
        let see = self.see[1] as! Int
        let smell = self.smell[1] as! Int
        let hear = self.hear[1] as! Int
        let feel = self.feel[1] as! Int
        return Int((see + smell + hear + feel) / 4)
    }
}

//
//  Report.swift
//  cbe
//
//  Created by Victor Korir on 8/13/17.
//  Copyright © 2017 Victor Korir. All rights reserved.
//

import Foundation

class Report {
    var id: String                      // id of the poster
    var location: [String: Double]      // location of the post
    var time: Date                      // The date that the report was submitted
    var see: [String: Int]
    var smell: [String: Int]
    var hear: [String: Int]
    var feel: [String: Int]
    
    init(id: String, location: [String: Double], timeString: String, see: [String: Int], smell: [String: Int], hear: [String: Int], feel: [String: Int]) {
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
}

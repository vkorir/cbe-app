//
//  User.swift
//  cbe
//
//  Created by Victor Korir on 8/13/17.
//  Copyright © 2017 Victor Korir. All rights reserved.
//

import Foundation
import FirebaseAuth

class User {
    var id: String!
    var username: String!
    var name: String?
    var imagePath: String?
    
    init(authData: user) {
        self.id = user.id
        self.username = user.username
    }
}

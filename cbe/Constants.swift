//
//  Constants.swift
//  cbe
//
//  Created by Victor Korir on 7/13/17.
//  Copyright © 2017 Victor Korir. All rights reserved.
//

import UIKit

struct Config {
    static let googleMapsKey = "AIzaSyA-0DuTlaTDh94wqvhAGX_qbRglc4jQ22g"
    static let googlePlacesKey = "AIzaSyDauucAJvBOBO3lLxWtv5NzxStqadEdgcU"
    static let dateFormat = "yyyy-MM-dd HH:mm:ss.A"
}

struct Colors {
    static let primaryColor = UIColor(red: 0.22, green: 0.58, blue: 0.29, alpha: 1.0)
    static let secondaryColor = UIColor.lightGray
    let markerColors = [UIColor.green,
                        UIColor.red,
                        UIColor.blue]
}

struct Ids {
    static let signInToMain = "SignInToMain"
    static let reportToMain = "NewReportToMain"
}

struct LangSelection {
    static var language: Int = 0
    static let emailPlaceholder = ["email or username", "emaile la username"]
    static let passwordPlaceholder = ["password", "pasiwordie"]
    static let signUp = ["  Sign Up  ", "Regístrate"]
    static let signIn = ["  Sign In  ", "Registrarse"]
    
    
    static let home = ["Home", "Casa"]
    static let inspector = ["Inspector", "Inspector"]
    static let aboutUs = ["About Us", "Sobre Nosotros"]
    static let contactUs = ["Contact Us", "Contáctenos"]
    static let logOut = ["Log Out", "Cerrar Sesión"]
    
    
    static let newReport = ["New Report", "Nuevo Reporte"]
    static let useGPS = ["Or use GPS", "O usa GPS"]
    
    static let iSee = ["I See:", "Ya Veo:"]
    static let blackCloud = ["Black Cloud", "Nube Negra"]
    static let fire = ["Fire", "Lumbre"]
    static let dust = ["Dust", "Polvo"]
    static let flare = ["Flare", "Llamarada"]
    static let explosion = ["Explosion", "Explosión"]
    static let smoke = ["Smoke", "Humo"]
    
    static let iSmell = ["I Smell:", "Yo Huelo:"]
    static let gasoline = ["Gasoline"]
    static let oil = ["Oil"]
    static let rottenEggs = ["Rotten Eggs"]
    static let sweetSourAir = ["Sweet-Sour-Bitter Air"]
    
    static let iHear = ["I Hear:"]
    static let cars = ["Cars"]
    static let largerVehicles = ["Larger Vehicles"]
    static let dieselReuck = ["Diesel Truck"]
    
    static let iFeel = ["I Feel:"]
    static let breathingProblems = ["Breathing Problems"]
    static let skinIrritations = ["Skin Irritation"]
    static let burningEyesNoseThroat = ["Burning Eyes, Nose, Throat"]
    static let headache = ["Headache"]
    static let nausea = ["Nausea"]
}

struct Descriptions {
    static let see: [String] = ["Flare", "Fire", "Dust", "Black Cloud", "Explosion", "Smoke"]
    static let smell: [String] = ["Asphalt", "Coffee", "Pollen/Tree", "Gasoline/Oil", "Rotten Eggs", "Paint/Acetone", "Burnt Tire/Plastic", "Bakery/Bread", "Diesel Exhaust", "None of the above"]
    static let hear: [String] = ["Cars", "Larger Vehicles", "Diesel Truck"]
    static let feel: [String] = ["Headache", "Nausea", "Burning eyes, Nose, Throat", "Problem Breathing", "Skin Irritation"]
}

struct Path {
    static let Users = "Users"
    static let Posts = "Posts"
    static let id = "id"
    static let username = "username"
    static let name = "name"
    static let time = "time"
    static let location = "location"
    static let lat = "lat"
    static let lng = "lng"
    static let see = "see"
    static let smell = "smell"
    static let hear = "hear"
    static let feel = "feel"
    static let intensity = "intensity"
    static let imagePath = "imagePath"
}

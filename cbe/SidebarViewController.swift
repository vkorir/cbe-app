//
//  SidebarViewController.swift
//  cbe
//
//  Created by Victor Korir on 7/30/17.
//  Copyright © 2017 Victor Korir. All rights reserved.
//

import UIKit
import FirebaseAuth

class SidebarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signOutDidSelect(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError.localizedDescription)
        }
    }
}

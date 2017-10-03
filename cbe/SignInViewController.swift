//
//  SignInViewController.swift
//  cbe
//
//  Created by Victor Korir on 7/30/17.
//  Copyright © 2017 Victor Korir. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignInViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signUp: RoundButton!
    @IBOutlet weak var signIn: RoundButton!
    var handle: AuthStateDidChangeListenerHandle?
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLang()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.performSegue(withIdentifier: Ids.signInToMain, sender: nil)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }

    @IBAction func signUpDidTouch(_ sender: RoundButton) {
        // Register user with Firebase
        Auth.auth().createUser(withEmail: email.text!, password: password.text!, completion: { (user, error) in
            // Check that user isn't nil
            if let user = user {
                let uid = user.uid
                let username = user.email
                self.user = User(id: uid, username: username!)
                self.addUser()
            } else {
                // Error: check error and show message
                let alert = UIAlertController(title: "Error!",
                                              message: error?.localizedDescription,
                                              preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok",
                                             style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
        })
    }
    
    @IBAction func signInDidTouch(_ sender: RoundButton) {
        // Sign in the user with Firebase
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            // Check that sign in is successful
            if let user = user {
                // User is found, go to homescreen
                let uid = user.uid
                let username = user.email
                self.user = User(id: uid, username: username!)
                self.performSegue(withIdentifier: Ids.signInToMain, sender: nil)
            } else {
                // Error: check error and show message
                let alert = UIAlertController(title: "Error!",
                                              message: error?.localizedDescription,
                                              preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok",
                                                 style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func languageDidSelect(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex != LangSelection.language {
            LangSelection.language = sender.selectedSegmentIndex
            updateLang()
        }
    }
    
    func updateLang() {
        email.placeholder = LangSelection.emailPlaceholder[LangSelection.language]
        password.placeholder = LangSelection.passwordPlaceholder[LangSelection.language]
        signUp.titleLabel?.text = LangSelection.signUp[LangSelection.language]
        signIn.titleLabel?.text = LangSelection.signIn[LangSelection.language]
    }
    
    func dismissKeyBoard() {
        view.endEditing(true)
    }
    
    func addUser() {
        let usersRef = Database.database().reference(withPath: Path.Users)
        let data = [
            Path.id: user?.id,
            Path.username: user?.username,
            Path.name: user?.name,
            Path.imagePath: user?.imagePath
        ]
        usersRef.childByAutoId().setValue(data)
    }
}

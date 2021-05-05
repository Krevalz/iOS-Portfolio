//
//  AuthViewController.swift
//  BreakPoint
//
//  Created by Joshua Ramos on 9/22/17.
//  Copyright © 2017 Krevalent. All rights reserved.
//

import UIKit
import Firebase

class AuthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func loginWithEmailButtonPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
        present(loginVC!, animated: true, completion: nil)
    
    
    }
    
    @IBAction func loginWithFBButtonPressed(_ sender: Any) {
    }
    @IBAction func LoginWithGoogleButtonPressed(_ sender: Any) {
    }

}

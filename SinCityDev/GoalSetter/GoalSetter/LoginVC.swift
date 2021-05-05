//
//  LoginVC.swift
//  GoalSetter
//
//  Created by Joshua Ramos on 9/3/17.
//  Copyright © 2017 Krevalent. All rights reserved.
//

import UIKit

enum loginBtnFunc {
    case login
    case logout
    case signUp
}

class LoginVC: UIViewController {
    var appStartUp: Bool = true
    // Outlets
    @IBOutlet weak var usernameTextFld: UITextField!
    @IBOutlet weak var passwordTextFld: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    // Variables
    private var loginBtnFunc: loginBtnFunc = .login
    private var isLoggedIn: Bool {
        get {
            return DEFAULTS.bool(forKey: IS_LOGGED_IN)
        } set {
            DEFAULTS.set(newValue, forKey: IS_LOGGED_IN)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextFld.isHidden = true
        passwordTextFld.isHidden = true
        loginBtn.isHidden = true
        backBtn.isHidden = true
        signUpBtn.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if appStartUp {
            appStartUp = false
            performSegue(withIdentifier: TO_GOALS_VC, sender: nil)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if isLoggedIn {
            usernameTextFld.isHidden = true
            passwordTextFld.isHidden = true
            signUpBtn.isHidden = true
            loginBtnFunc = .logout
        } else {
            usernameTextFld.isHidden = false
            passwordTextFld.isHidden = false
            signUpBtn.isHidden = false
            loginBtnFunc = .login
        }
        backBtn.isHidden = false
        loginBtn.isHidden = false
        passwordTextFld.text = ""
        updateBtnTitle()
    }
    
    private func updateBtnTitle() {
        switch(loginBtnFunc) {
            case .login:
                loginBtn.setTitle("Login", for: .normal)
            case .logout:
                loginBtn.setTitle("Logout", for: .normal)
            case .signUp:
                loginBtn.setTitle("Sign Up!", for: .normal)
        }
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        let username = usernameTextFld.text ?? ""
        let password = passwordTextFld.text ?? ""
        
        switch (loginBtnFunc) {
            case .login:
                if !(username.isEmpty) || !(password.isEmpty) {
                    // Have valid username and password
                    FirebaseManager.instance.login(email: username, password: password, completion: { (user, error) in
                        if let error = error {
                            self.isLoggedIn = false
                            print(error)
                        } else {
                            self.isLoggedIn = true
                            self.performSegue(withIdentifier: TO_GOALS_VC, sender: nil)
                        }
                    })
                }
            case .logout:
                FirebaseManager.instance.logout(completion: { (error) in
                    if error != nil {
                        print("Did not sign out")
                    } else {
                        isLoggedIn = false
                        print("Signout Confirmed")
                    }
                    usernameTextFld.isHidden = false
                    passwordTextFld.isHidden = false
                    signUpBtn.isHidden = false
                    loginBtnFunc = .login
                    updateBtnTitle()
                })
            case .signUp:
                if !(username.isEmpty) || !(password.isEmpty) {
                    FirebaseManager.instance.signUp(email: username, password: password, completion: { (user, error) in
                        if let error = error {
                            self.isLoggedIn = false
                            print(error)
                        } else {
                            self.isLoggedIn = true
                            self.performSegue(withIdentifier: TO_GOALS_VC, sender: nil)
                        }
                    })
                }
        }
    }
    
    @IBAction func signUpBtnPressed(_ sender: Any) {
        signUpBtn.isHidden = true
        loginBtnFunc = .signUp
        updateBtnTitle()
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_GOALS_VC, sender: nil)
    }
}

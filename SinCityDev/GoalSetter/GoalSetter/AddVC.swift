//
//  AddVC.swift
//  GoalSetter
//
//  Created by Joshua Ramos on 9/3/17.
//  Copyright © 2017 Krevalent. All rights reserved.
//

import UIKit

class AddVC: UIViewController {
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var goalTextFld: UITextField!
    @IBOutlet weak var popupLbl: UILabel!

    var isLoggedIn: Bool {
        get {
            return DEFAULTS.bool(forKey: IS_LOGGED_IN)
        } set {
            DEFAULTS.set(newValue, forKey: IS_LOGGED_IN)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popupLbl.text = "Enter your goal:"
        backgroundView.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.backgroundView.alpha = 0.3
        }
    }    

    @IBAction func confirmBtnPressed(_ sender: Any) {
        if isLoggedIn {
            let goal = goalTextFld.text ?? ""
            // We have a current user
            if !goal.isEmpty
            {
                FirebaseManager.instance.appendGoal(Goal(title: goal), completion: { (error) in
                    if error == nil {
                        self.dismiss(animated: true, completion: nil)
                    } else {
                        print(error!)
                    }
                })
            }
        }
        else {
            // Show that you can't save data
            popupLbl.text = "You must login!!!"
        }
    }    
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        UIView.animate(withDuration: 0.3) { 
            self.backgroundView.alpha = 0
        }
        self.dismiss(animated: true, completion: nil)
    }
}


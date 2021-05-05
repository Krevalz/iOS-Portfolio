//
//  GoalsVC.swift
//  GoalSetter
//
//  Created by Joshua Ramos on 9/3/17.
//  Copyright © 2017 Krevalent. All rights reserved.
//

import UIKit

class GoalsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // Outlets
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var goalsTable: UITableView!
    
    // Variables
    var goalsArray: [String] {
        get {
            return DEFAULTS.stringArray(forKey: GOALS_ARRAY) ?? [String]()
        } set {
            DEFAULTS.set(newValue, forKey: GOALS_ARRAY)
        }
    }
    var isLoggedIn: Bool {
        get {
            return DEFAULTS.bool(forKey: IS_LOGGED_IN)
        } set {
            DEFAULTS.set(newValue, forKey: IS_LOGGED_IN)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalsArray = [String]()
        createListener()
        
        goalsTable.allowsMultipleSelectionDuringEditing = true
        goalsTable.dataSource = self
        goalsTable.delegate = self
    }
    
    // Actions
    @IBAction func settingBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // Methods
    func createListener() {
        FirebaseManager.instance.createListener { (goalsArray) in
            self.goalsArray = goalsArray
            self.goalsTable.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goalsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GoalCell") as? GoalCell {
            // does not try to access an empty goals array
            if !goalsArray.isEmpty {
                let goal = Goal(title: goalsArray[indexPath.row])
                cell.updateView(goal: goal)
                return cell
            } else {
                return GoalCell()
            }
        } else {
            return GoalCell()
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            if isLoggedIn
            {
                goalsArray.remove(at: indexPath.row)
                FirebaseManager.instance.saveGoals(goalsArray, completion: { (error) in
                    if let error = error {
                        print(error)
                    }
                })
                
                // Makes sure to refresh table if last element is deleted since
                // firebase listener will not be called when last element is deleted
                if goalsArray.isEmpty {
                    goalsTable.reloadData()
                }
            }
        }
    }

}

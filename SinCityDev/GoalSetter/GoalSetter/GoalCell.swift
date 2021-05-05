//
//  GoalCell.swift
//  GoalSetter
//
//  Created by Joshua Ramos on 9/3/17.
//  Copyright © 2017 Krevalent. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {
    

    @IBOutlet weak var goalLabel: UILabel!
    
    func updateView(goal: Goal) {
        goalLabel.text = goal.title
    }
}

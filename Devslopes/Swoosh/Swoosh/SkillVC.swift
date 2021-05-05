//
//  SkillVC.swift
//  Swoosh
//
//  Created by Joshua Ramos on 8/2/17.
//  Copyright © 2017 Krevalent. All rights reserved.
//

import UIKit

class SkillVC: UIViewController {

    @IBOutlet weak var iAmLbl: UILabel!
    
    var player: Player!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var labelText = iAmLbl.text
        labelText = labelText! + " \(player.desiredLeague!)"
        iAmLbl.text = labelText
    }

}

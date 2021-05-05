//
//  ChatVC.swift
//  Smack
//
//  Created by Joshua Ramos on 8/30/17.
//  Copyright © 2017 Krevalent. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
// Outlets
    @IBOutlet weak var menuButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // reveals menu with button press
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        // allows the swipe reveal
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        // allows the tap to return
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    }
}

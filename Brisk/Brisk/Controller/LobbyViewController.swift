//
//  ViewController.swift
//  Brisk
//
//  Created by Joshua Ramos on 1/6/18.
//  Copyright © 2018 Joshua Ramos. All rights reserved.
//

import UIKit

class LobbyViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    var scoreTimer: Timer!
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = nil
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(startCounting))
        scoreLabel.addGestureRecognizer(tapGesture)
        scoreLabel.isUserInteractionEnabled = true
    }
    
    @IBAction func newGameButtonPressed(_ sender: Any) {
        killTimer()
        self.performSegue(withIdentifier: GameViewControllerSegue, sender: nil)
    }
    
    @IBAction func optionsButtonPressed(_ sender: Any) {
        createTimer()
    }
    
    @IBAction func helpButtonPressed(_ sender: Any) {
        killTimer()
    }
    
}

extension LobbyViewController {
    func createTimer() {
        scoreTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startCounting), userInfo: nil, repeats: true)
    }
    
    func killTimer() {
        if scoreTimer != nil {
            scoreTimer.invalidate()
        }
    }
    
    @objc func startCounting() {
        scoreLabel.text = String(score)
        score += 1
    }
}


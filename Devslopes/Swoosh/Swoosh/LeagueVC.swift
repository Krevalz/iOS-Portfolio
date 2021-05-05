//
//  LeagueVC.swift
//  Swoosh
//
//  Created by Joshua Ramos on 8/2/17.
//  Copyright © 2017 Krevalent. All rights reserved.
//

import UIKit

class LeagueVC: UIViewController {

    var player: Player!
    
    @IBOutlet weak var nextBtn: BorderButtton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // so that code is not loaded until screen opens up
        player = Player()
    }
    
    @IBAction func undwindFromSkillVC (unwindSeque: UIStoryboardSegue) {
        
    }
    
    @IBAction func onMensTapped(_ sender: Any) {
       selectedLeague(leagueType: "men")
    }
    
    @IBAction func onWomensTapped(_ sender: Any) {
       selectedLeague(leagueType: "women")
    }
    
    @IBAction func onCoedTapped(_ sender: Any) {
        selectedLeague(leagueType: "coed")
    }
    
    func selectedLeague(leagueType: String) {
        player.desiredLeague = leagueType
        nextBtn.isEnabled = true
    }
    
    @IBAction func nextButtonTapped(_ sender: BorderButtton) {
        performSegue(withIdentifier: "skillVCSeque", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let skillVC = segue.destination as? SkillVC {
            skillVC.player = player
        }
    }
}

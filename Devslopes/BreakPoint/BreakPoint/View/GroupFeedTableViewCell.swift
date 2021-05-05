//
//  GroupFeedTableViewCell.swift
//  BreakPoint
//
//  Created by Joshua Ramos on 10/1/17.
//  Copyright © 2017 Krevalent. All rights reserved.
//

import UIKit

class GroupFeedTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    func configureCell(profileImage: UIImage, email: String, content: String) {
        self.profileImage.image = profileImage
        self.emailLabel.text = email
        self.contentLabel.text = content
    }
    
}

//
//  BorderButtton.swift
//  Swoosh
//
//  Created by Joshua Ramos on 8/1/17.
//  Copyright © 2017 Krevalent. All rights reserved.
//

import UIKit

class BorderButtton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
            layer.borderWidth = 2.0
            layer.borderColor = UIColor.white.cgColor
            layer.cornerRadius = 8.0
    }
}

//
//  ListView.swift
//  Trello-Clone
//
//  Created by Amanuel Ketebo on 11/19/17.
//  Copyright © 2017 SinCityDev. All rights reserved.
//

import UIKit

class ListView: UIView {
    @IBOutlet var view: ListView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var closeButton: RoundButton!
    @IBOutlet weak var addCardButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("ListView", owner: self, options: nil)
        addSubview(view)
        
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.layer.shadowRadius = 4
    }
}

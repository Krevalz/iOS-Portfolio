//
//  CategoryCell.swift
//  CoderSwag
//
//  Created by Joshua Ramos on 8/4/17.
//  Copyright © 2017 Krevalent. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    func updateView(category: Category) {
        categoryImage.image = UIImage(named: category.imageName)
        categoryTitle.text = category.title
    }
}

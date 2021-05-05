//
//  Category.swift
//  CoderSwag
//
//  Created by Joshua Ramos on 8/4/17.
//  Copyright © 2017 Krevalent. All rights reserved.
//

import Foundation

struct Category {
    private(set) public var title: String
    private(set) public var imageName: String

    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}

//
//  Group.swift
//  BreakPoint
//
//  Created by Joshua Ramos on 9/30/17.
//  Copyright © 2017 Krevalent. All rights reserved.
//

import Foundation

class Group {
    private(set) public var groupTitle: String
    private(set) public var groupDescription: String
    private(set) public var key: String
    private(set) public var memberCount: Int
    private(set) public var members: [String]

    init(title: String, description: String, key: String, members: [String], memberCount: Int) {
        self.groupTitle = title
        self.groupDescription = description
        self.key = key
        self.members = members
        self.memberCount = memberCount
    }
}

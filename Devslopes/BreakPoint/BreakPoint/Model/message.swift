//
//  message.swift
//  BreakPoint
//
//  Created by Joshua Ramos on 9/25/17.
//  Copyright © 2017 Krevalent. All rights reserved.
//

import Foundation

class Message {
    private var _content: String
    private var _senderId: String

    var content: String {
        return _content
    }
    var senderId: String {
        return _senderId
    }
    
    init(content: String, senderId: String) {
        self._content = content
        self._senderId = senderId
    }
    
}

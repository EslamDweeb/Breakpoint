//
//  Message.swift
//  Breakpoint
//
//  Created by eslam dweeb on 4/1/18.
//  Copyright © 2018 eslam dweeb. All rights reserved.
//

import Foundation
class Message{
    private var _contant: String
    private var _senderId: String
    
    var contant: String{
        return _contant
    }
    var senderId: String{
        return _senderId
    }
    init(contant: String,senderId: String) {
        self._contant = contant
        self._senderId = senderId
    }
}

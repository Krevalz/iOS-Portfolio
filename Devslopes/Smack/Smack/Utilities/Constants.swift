//
//  Constants.swift
//  Smack
//
//  Created by Joshua Ramos on 8/30/17.
//  Copyright © 2017 Krevalent. All rights reserved.
//

import Foundation

// URL Constants
let BASE_URL = "https://dasmack.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

// typealias is giving a name to a type, typealias jonny = String
typealias CompletionHandler = (_ Success: Bool) -> ()

// Seques
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

// User DefaultsFoundation
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedin"
let USER_EMAIL = "useremail"

// Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]


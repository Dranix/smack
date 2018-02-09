//
//  Constant.swift
//  smack
//
//  Created by Duong Dang Hoang on 24/1/18.
//  Copyright © 2018 Duong Dang Hoang. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()
//Service URL
let BASE_URL = "https://justmysmack.herokuapp.com/v1/"
let URL_AUTH = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_ADD = "\(BASE_URL)user/add"

//User default
let LOGGED_IN_KEY = "loggedIn"
let AUTH_TOKEN_KEY = "authKey"
let EMAIL_KEY = "emailKey"

//Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND_TO_CHANNEL = "unwindToChannel"

//Header
let HEADER = ["Content-Type":"application/json;charset=utf-8"]

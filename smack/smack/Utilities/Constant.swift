//
//  Constant.swift
//  smack
//
//  Created by Duong Dang Hoang on 24/1/18.
//  Copyright © 2018 Duong Dang Hoang. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

enum URL{
    static let BASE = "https://justmysmack.herokuapp.com/v1/"
    static let AUTH = "\(URL.BASE)account/register"
    static let LOGIN = "\(URL.BASE)account/login"
    static let ADD = "\(URL.BASE)user/add"
    static let FIND_USER_BY_EMAIL = "\(URL.BASE)user/byEmail/"
}

enum NOTIFICATION{
    static let USER_DATA_CHANGED = Notification.Name("userDidLogIn")
}

enum KEYS{
    static let LOGGED_IN = "loggedIn"
    static let AUTH_TOKEN = "authKey"
    static let EMAIL = "emailKey"

}

enum SEGUES{
    static let TO_LOGIN = "toLogin"
    static let TO_CREATE_ACCOUNT = "toCreateAccount"
    static let UNWIND_TO_CHANNEL = "unwindToChannel"
    static let TO_AVATAR_PICKER = "toAvatarPicker"
}

enum REQUEST{
    static let HEADER = [
        "Content-Type":"application/json;charset=utf-8"
    ]
    
    static let BEARER_HEADER = [
        "Content-Type": "application/json;chartype=utf-8",
        "Authorization": "Bearer \(AuthService.instance.authToken)"
    ]
}


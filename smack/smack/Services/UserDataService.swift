//
//  UserDataService.swift
//  smack
//
//  Created by Duong Dang Hoang on 5/2/18.
//  Copyright © 2018 Duong Dang Hoang. All rights reserved.
//

import Foundation

class UserDataService{
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var avatarColor = "[0.5, 0.5, 0.5, 1]"
    public private(set) var avatarName = "profileDefault"
    public private(set) var email = ""
    public private(set) var name = ""

    func setUserData(id: String, avatarColor: String, avatarName: String, email: String, name: String){
        self.id = id
        self.avatarColor = avatarColor
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String){
        self.avatarName = avatarName
    }
}

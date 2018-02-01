//
//  AuthService.swift
//  smack
//
//  Created by Duong Dang Hoang on 1/2/18.
//  Copyright © 2018 Duong Dang Hoang. All rights reserved.
//

import Foundation
import Alamofire

class AuthService{
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn: Bool {
        get{
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        
        set{
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken: String{
        get{
            return defaults.value(forKey: AUTH_TOKEN_KEY) as! String
        }
        
        set{
            defaults.set(newValue, forKey: AUTH_TOKEN_KEY)
        }
    }
    
    var email: String{
        get{
            return defaults.value(forKey: EMAIL_KEY) as! String
        }
        
        set{
            defaults.set(newValue, forKey: EMAIL_KEY)
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler){
        let emailLowercase = email.lowercased()
        
        let body = [
            "email": emailLowercase,
            "password": password
        ]
        
        let header = [
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        Alamofire.request(URL_AUTH, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            if response.result.error == nil{
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}

//
//  AuthService.swift
//  smack
//
//  Created by Duong Dang Hoang on 1/2/18.
//  Copyright © 2018 Duong Dang Hoang. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService{
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn: Bool {
        get{
            return defaults.bool(forKey: KEYS.LOGGED_IN)
        }
        
        set{
            defaults.set(newValue, forKey: KEYS.LOGGED_IN)
        }
    }
    
    var authToken: String{
        get{
            return defaults.value(forKey: KEYS.AUTH_TOKEN) as! String
        }
        
        set{
            defaults.set(newValue, forKey: KEYS.AUTH_TOKEN)
        }
    }
    
    var email: String{
        get{
            return defaults.value(forKey: KEYS.EMAIL) as! String
        }
        
        set{
            defaults.set(newValue, forKey: KEYS.EMAIL)
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler){
        let emailLowercase = email.lowercased()
        
        let body = [
            "email": emailLowercase,
            "password": password
        ]
        
        Alamofire.request(URL.AUTH, method: .post, parameters: body, encoding: JSONEncoding.default, headers: REQUEST.HEADER).responseString { (response) in
            if response.result.error == nil{
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler){
        let emailLowercase = email.lowercased()
        
        let body = [
            "email": emailLowercase,
            "password": password
        ]
        
        Alamofire.request(URL.LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: REQUEST.HEADER).responseJSON { (response) in
            if response.result.error == nil{
                guard let data = response.data else { return }
                let json = JSON(data)
                self.email = json["user"].stringValue
                self.authToken = json["token"].stringValue
                self.isLoggedIn = true
                
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler){
        let lowerCaseEmail = email.lowercased()
        
        let body = [
            "name": name,
            "email": lowerCaseEmail,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
        
        Alamofire.request(URL.ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: REQUEST.BEARER_HEADER).responseJSON { (response) in
            
            if response.result.error == nil{
                guard let data = response.data else { return }
                self.setUserInfo(data: data)

                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func findUser(completion: @escaping CompletionHandler){
        Alamofire.request("\(URL.FIND_USER_BY_EMAIL)\(email)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: REQUEST.BEARER_HEADER).responseJSON {(response) in
            
            if(response.result.error == nil){
                guard let data = response.data else { return }
                self.setUserInfo(data: data)
                
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func setUserInfo(data: Data){
        let json = JSON(data)
        let id = json["_id"].stringValue
        let color = json["avatarColor"].stringValue
        let avatarName = json["avatarName"].stringValue
        let email = json["email"].stringValue
        let name = json["name"].stringValue
        
        UserDataService.instance.setUserData(id: id, avatarColor: color, avatarName: avatarName, email: email, name: name)
    }
}

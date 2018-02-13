//
//  ChannelVC.swift
//  smack
//
//  Created by Duong Dang Hoang on 19/1/18.
//  Copyright © 2018 Duong Dang Hoang. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    //IBOutlets
    @IBOutlet weak var profileImg: CircleImage!
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChange(_:)), name: NOTIFICATION.USER_DATA_CHANGED, object: nil    )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupUserInfo()
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        self.setupUserInfo()
    }
    
    func setupUserInfo(){
        if AuthService.instance.isLoggedIn == true{
            profileImg.layer.backgroundColor = UserDataService.instance.getAvatarColor().cgColor
            profileImg.image = UIImage(named: UserDataService.instance.avatarName)
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
        }else{
            loginBtn.setTitle("Login", for: .normal)
            profileImg.image = UIImage(named: "menuProfileIcon")
            profileImg.backgroundColor = UIColor.clear
        }
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        if AuthService.instance.isLoggedIn == true{
            let profileVC = ProfileVC()
            profileVC.modalPresentationStyle = .custom
            present(profileVC, animated: true, completion: nil)
        }else{
            performSegue(withIdentifier: SEGUES.TO_LOGIN, sender: nil)
        }
    }
}

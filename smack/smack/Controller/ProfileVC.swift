//
//  ProfileVC.swift
//  smack
//
//  Created by Duong Dang Hoang on 12/2/18.
//  Copyright © 2018 Duong Dang Hoang. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }

    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        UserDataService.instance.logout()
        NotificationCenter.default.post(name: NOTIFICATION.USER_DATA_CHANGED, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    func setupView(){
        profileImg.image = UIImage(named: UserDataService.instance.avatarName)
        nameLbl.text = UserDataService.instance.name
        emailLbl.text = UserDataService.instance.email
        profileImg.backgroundColor = UserDataService.instance.getAvatarColor()
        
        let tappedGesture = UITapGestureRecognizer(target: self, action: #selector(close(_:)))
        view.addGestureRecognizer(tappedGesture)
    }
    
    @objc func close(_ gesture:UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
}

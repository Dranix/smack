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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        profileImg.layer.backgroundColor = UserDataService.instance.getAvatarColor().cgColor
        profileImg.image = UIImage(named: UserDataService.instance.avatarName)
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: SEGUES.TO_LOGIN, sender: nil)
    }
}

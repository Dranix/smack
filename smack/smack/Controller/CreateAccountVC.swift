//
//  CreateAccountVC.swift
//  smack
//
//  Created by Duong Dang Hoang on 24/1/18.
//  Copyright © 2018 Duong Dang Hoang. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    //Outlets
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(){
        self.view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName.contains("light"){
            profileImg.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        profileImg.image = UIImage(named: UserDataService.instance.avatarName)
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
    }
    
    @IBAction func chooseAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func generateBGColorPressed(_ sender: Any) {
        let r = CGFloat(arc4random_uniform(225)) / 255
        let b = CGFloat(arc4random_uniform(225)) / 255
        let g = CGFloat(arc4random_uniform(225)) / 255
        
        let randomColor = UIColor(red: r, green: g, blue: b, alpha: 0.8)
        UIView.animate(withDuration: 0.2) {
            self.profileImg.backgroundColor = randomColor
        }
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let name = userNameTxt.text, userNameTxt.text != "" else { return }
        guard let email = emailTxt.text, emailTxt.text != "" else { return }
        guard let password = passwordTxt.text, passwordTxt.text != "" else { return }
        
        self.spinner.startAnimating()
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success{
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success{
                        AuthService.instance.createUser(name: name, email: email, avatarName: UserDataService.instance.avatarName, avatarColor: UserDataService.instance.avatarColor, completion: { (success) in
                            if success{
                                self.spinner.stopAnimating()
                                self.performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
                                NotificationCenter.default.post(name: NOTI_DID_LOG_IN, object: nil)
                            }
                        })
                    }
                })
            }
        }
    }
}

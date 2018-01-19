//
//  ChatVC.swift
//  smack
//
//  Created by Duong Dang Hoang on 19/1/18.
//  Copyright © 2018 Duong Dang Hoang. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    @IBOutlet weak var menuBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
    }
}

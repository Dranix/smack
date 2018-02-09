//
//  CircleImage.swift
//  smack
//
//  Created by Duong Dang Hoang on 9/2/18.
//  Copyright © 2018 Duong Dang Hoang. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImage: UIImageView {
    override func awakeFromNib() {
        setupView()
    }

    func setupView(){
        self.layer.cornerRadius = self.bounds.size.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
}

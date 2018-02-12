//
//  UIColor+rgba.swift
//  smack
//
//  Created by Duong Dang Hoang on 9/2/18.
//  Copyright © 2018 Duong Dang Hoang. All rights reserved.
//

import Foundation

extension UIColor {
    var redValue: CGFloat{ return CIColor(color: self).red }
    var greenValue: CGFloat{ return CIColor(color: self).green }
    var blueValue: CGFloat{ return CIColor(color: self).blue }
    var alphaValue: CGFloat{ return CIColor(color: self).alpha }
}

//
//  UITextField+PlaceholderColor.swift
//  smack
//
//  Created by Duong Dang Hoang on 9/2/18.
//  Copyright © 2018 Duong Dang Hoang. All rights reserved.
//

import Foundation

extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedStringKey.foregroundColor: newValue!])
        }
    }
}

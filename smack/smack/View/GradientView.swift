//
//  GradientView.swift
//  smack
//
//  Created by Duong Dang Hoang on 23/1/18.
//  Copyright © 2018 Duong Dang Hoang. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.231372549, green: 0.2274509804, blue: 0.7960784314, alpha: 1) {
        didSet{
            setNeedsLayout()
        }
    }

    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.368627451, green: 0.7333333333, blue: 0.8, alpha: 1){
        didSet{
            setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        let gradientView = CAGradientLayer()
        gradientView.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientView.startPoint = CGPoint(x: 0, y: 0)
        gradientView.endPoint = CGPoint(x: 1, y: 1)
        gradientView.frame = self.bounds
    
        self.layer.insertSublayer(gradientView, at: 0)
    }
}

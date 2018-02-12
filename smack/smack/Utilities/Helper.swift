//
//  Helper.swift
//  smack
//
//  Created by Duong Dang Hoang on 9/2/18.
//  Copyright © 2018 Duong Dang Hoang. All rights reserved.
//

import Foundation

class Helper{
    static func fromUIColorToString(color: UIColor) -> String{
        return "[\(color.redValue), \(color.greenValue), \(color.blueValue), \(color.alphaValue)]"
    }
    
    static func fromStringToUIColor(colorString: String) -> UIColor{
        let scanner = Scanner(string: colorString)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        var r, b, g, a : NSString?
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)

        let defaultColor = UIColor.gray
        guard let unwrappedR = r else { return defaultColor}
        guard let unwrappedG = g else { return defaultColor}
        guard let unwrappedB = b else { return defaultColor}
        guard let unwrappedA = a else { return defaultColor}
        
        let rFloat = CGFloat(unwrappedR.doubleValue)
        let gFloat = CGFloat(unwrappedG.doubleValue)
        let bFloat = CGFloat(unwrappedB.doubleValue)
        let aFloat = CGFloat(unwrappedA.doubleValue)
        
        return UIColor(red: rFloat, green: gFloat, blue: bFloat, alpha: aFloat)
    }
}

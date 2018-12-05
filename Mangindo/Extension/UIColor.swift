//
//  UIColor.swift
//  Mangindo
//
//  Created by Gallant Pratama on 8/30/17.
//  Copyright © 2017 Gallant Pratama. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    public convenience init(hex: String) {
        let characterSet = (CharacterSet.whitespacesAndNewlines as NSCharacterSet).mutableCopy() as! NSMutableCharacterSet
        characterSet.formUnion(with: CharacterSet(charactersIn: "#"))
        let cString = hex.trimmingCharacters(in: characterSet as CharacterSet).uppercased()
        if (cString.count != 6) {
            self.init(white: 1.0, alpha: 1.0)
        } else {
            var rgbValue: UInt32 = 0
            Scanner(string: cString).scanHexInt32(&rgbValue)
            
            self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                      alpha: CGFloat(1.0))
        }
    }
    
    public convenience init(hex: UInt32, alpha: CGFloat) {
        let red = CGFloat((hex & 0xFF0000) >> 16)/256.0
        let green = CGFloat((hex & 0xFF00) >> 8)/256.0
        let blue = CGFloat(hex & 0xFF)/256.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red) / 255
        let newGreen = CGFloat(green) / 255
        let newBlue = CGFloat(blue) / 255
        
        self.init(red: newRed,green: newGreen, blue: newBlue, alpha: 1.0)
    }
}

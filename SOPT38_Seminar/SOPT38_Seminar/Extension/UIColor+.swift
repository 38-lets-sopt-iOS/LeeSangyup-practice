//
//  UIColor+.swift
//  SOPT38_Seminar
//
//  Created by 이상엽 on 4/9/26.
//

import UIKit

extension UIColor {
    static var Primary_orange: UIColor {
        return UIColor(hex: "#FF6F0F")
    }
    
    static var Grey500: UIColor {
        return UIColor(hex: "#626262")
    }
    
    static var Grey400: UIColor {
        return UIColor(hex: "#9C9C9C")
    }
    
    static var Grey300: UIColor {
        return UIColor(hex: "#ACB0B9")
    }
    
    static var Grey200: UIColor {
        return UIColor(hex: "#DDDEE3")
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}

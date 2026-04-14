//
//  UIButton+.swift
//  SOPT38_Seminar
//
//  Created by 이상엽 on 4/9/26.
//

import UIKit

extension UIButton {
    
    func addTitleAttribute(title: String, titleColor: UIColor, fontName: UIFont) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = fontName
    }
}

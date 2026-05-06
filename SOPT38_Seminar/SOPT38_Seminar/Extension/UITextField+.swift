//
//  UITextField+.swift
//  SOPT38_Seminar
//
//  Created by 이상엽 on 4/14/26.
//

import UIKit

extension UITextField {
    func setLeftPadding(_ width: CGFloat) {
        leftView  = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 0))
        leftViewMode = .always
    }
}

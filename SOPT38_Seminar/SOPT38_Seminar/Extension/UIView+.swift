//
//  UIView+.swift
//  SOPT38_Seminar
//
//  Created by 이상엽 on 4/9/26.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}

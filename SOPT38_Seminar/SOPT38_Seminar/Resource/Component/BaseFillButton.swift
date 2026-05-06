//
//  BaseFillButton.swift
//  SOPT38_Seminar
//
//  Created by 이상엽 on 4/9/26.
//

import UIKit

class BaseFillButton: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            isEnabled ? setEnableButton() : setDisableButton()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFillButton()
        self.isEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupFillButton() {
        self.addTitleAttribute(title: "", titleColor: .white, fontName: .subhead1)
        self.layer.cornerRadius = 6
        self.titleLabel?.textAlignment = .center
    }
    
    private func setEnableButton() {
        isUserInteractionEnabled = true
        setTitleColor(.white, for: .normal)
        backgroundColor = .Primary_orange
    }
    
    private func setDisableButton() {
        isUserInteractionEnabled = false
        backgroundColor = .Grey200
        setTitleColor(.Grey300, for: .normal)
    }
}

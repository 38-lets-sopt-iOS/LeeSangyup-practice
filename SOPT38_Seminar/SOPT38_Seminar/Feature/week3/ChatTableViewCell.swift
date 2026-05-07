//
//  ChatTableViewCell.swift
//  SOPT38_Seminar
//
//  Created by 이상엽 on 4/25/26.
//

import UIKit

import SnapKit
import Then

class ChatTableViewCell: UITableViewCell {
    
    static let identifier = "ChatTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let profileImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private let nameLabel = UILabel().then {
        $0.font = .subhead3
    }
    
    private let locationLabel = UILabel().then {
        $0.font = .info12
        $0.textColor = .Grey400
    }
    
    private let messageLabel = UILabel().then {
        $0.font = .subhead5
    }
    
    private let productImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private func setUI() {
            [profileImageView, nameLabel, locationLabel, messageLabel, productImageView].forEach {
                contentView.addSubview($0)
            }
        }
    
    private func setLayout() {
        profileImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.size.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16.5)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
        }
        
        locationLabel.snp.makeConstraints {
            $0.centerY.equalTo(nameLabel.snp.centerY)
            $0.leading.equalTo(nameLabel.snp.trailing).offset(4)
        }
        
        messageLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(4)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
        }
        
        productImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(40)
        }
    }
}

extension ChatTableViewCell {
    func dataBind(_ chatData: ChatModel) {
        profileImageView.image = chatData.profileImg
        nameLabel.text = chatData.name
        locationLabel.text = chatData.place
        messageLabel.text = chatData.message
        productImageView.image = chatData.itemImg
    }
}

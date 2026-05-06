//
//  ItemCollectionViewCell.swift
//  SOPT38_Seminar
//
//  Created by 이상엽 on 4/25/26.
//

import UIKit

import SnapKit
import Then

protocol ItemCollectionViewCellDelegate: AnyObject {
    func heartbuttonDidTap(cell: ItemCollectionViewCell)
}

class ItemCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ItemCollectionViewCell"
    
    weak var delegate: ItemCollectionViewCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let itemImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 4
    }
    
    private let nameLabel = UILabel().then {
        $0.font = .subhead5
    }
    
    private let priceLabel = UILabel().then {
        $0.font = .subhead3
        $0.textColor = .Primary_orange
    }
    
    lazy var heartButton = UIButton().then {
        $0.setImage(.heartRedIcon, for: .selected)
        $0.setImage(.heartGrayIcon, for: .normal)
        $0.addTarget(self, action: #selector(heartButtonDidTap), for: .touchUpInside)
    }
    
    private func setUI() {
        [itemImageView, nameLabel, priceLabel, heartButton].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        itemImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(9)
            $0.bottom.equalToSuperview().inset(59)
            $0.size.equalTo(139)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(itemImageView.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(9)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(9)
        }
        
        heartButton.snp.makeConstraints {
            $0.trailing.bottom.equalTo(itemImageView).inset(8)
            $0.size.equalTo(16)
        }
    }
    
   @objc
   private func heartButtonDidTap(){
       delegate?.heartbuttonDidTap(cell: self)
   }
}

extension ItemCollectionViewCell {
    func dataBind(_ itemData: ItemModel) {
        itemImageView.image = itemData.itemImg
        nameLabel.text = itemData.name
        priceLabel.text = itemData.price
        heartButton.isSelected = itemData.heartIsSelected
    }
}

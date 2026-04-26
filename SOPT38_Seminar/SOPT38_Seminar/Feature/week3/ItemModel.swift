//
//  ItemModel.swift
//  SOPT38_Seminar
//
//  Created by 이상엽 on 4/25/26.
//

import UIKit

struct ItemModel {
    let itemImg: UIImage
    let name: String
    let price: String
    var heartIsSelected: Bool
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(itemImg: .rectangle0, name: "가나디", price: "1,000원", heartIsSelected: false),
            ItemModel(itemImg: .rectangle1, name: "오쏘몰", price: "2,000원", heartIsSelected: false),
            ItemModel(itemImg: .rectangle2, name: "애플워치", price: "3,000원", heartIsSelected: false),
            ItemModel(itemImg: .rectangle3, name: "가방", price: "4,000원", heartIsSelected: false),
            ItemModel(itemImg: .rectangle4, name: "헤드셋", price: "5,000원", heartIsSelected: false),
            ItemModel(itemImg: .rectangle5, name: "틴트", price: "4,000원", heartIsSelected: false),
            ItemModel(itemImg: .rectangle6, name: "카메라", price: "3,000원", heartIsSelected: false),
            ItemModel(itemImg: .rectangle7, name: "로션", price: "2,000원", heartIsSelected: false),
            ItemModel(itemImg: .rectangle8, name: "락스", price: "1,000원", heartIsSelected: false),
            ItemModel(itemImg: .rectangle9, name: "가방", price: "2,000원", heartIsSelected: false),
            ItemModel(itemImg: .rectangle10, name: "헤드셋", price: "3,000원", heartIsSelected: false),
            ItemModel(itemImg: .rectangle11, name: "틴트", price: "4,000원", heartIsSelected: false)
        ]
    }
}

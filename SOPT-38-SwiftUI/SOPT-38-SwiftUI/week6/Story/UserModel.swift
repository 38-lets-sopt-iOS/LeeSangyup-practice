//
//  UserModel.swift
//  SOPT-38-SwiftUI
//
//  Created by 이상엽 on 5/16/26.
//

import Foundation

struct UserModel: Identifiable {
    let id = UUID()
    let name: String
    let message: String
}

extension UserModel {
    static let users: [UserModel] = [
        UserModel(name: "나연", message: "듀듀듀"),
        UserModel(name: "소은", message: "영화 보러 가자요"),
        UserModel(name: "승희", message: "버블티머글사람"),
        UserModel(name: "교은", message: "내일 점심 어때요?"),
        UserModel(name: "지인", message: "내 말 들리나요")
    ]
}

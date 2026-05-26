//
//  GetUserInfoResponseDTO.swift
//  SOPT38_Seminar
//
//  Created by 이상엽 on 5/7/26.
//

import Foundation

struct GetUserInfoResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let data: UserInformation
}

struct UserInformation: Decodable {
    let id: Int
    let loginId: String
    let name: String
    let email: String
    let age: Int
    let part: String
}

//
//  LoginResponseDTO.swift
//  SOPT38_Seminar
//
//  Created by 이상엽 on 5/7/26.
//

import Foundation

struct LoginResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let meta: ErrorResponseDTO?
    let data: UserId?
}

struct UserId: Decodable {
    let userId: Int
}

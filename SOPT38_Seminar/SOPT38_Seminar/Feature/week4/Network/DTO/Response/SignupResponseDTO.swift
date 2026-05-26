//
//  SignupResponseDTO.swift
//  SOPT38_Seminar
//
//  Created by 이상엽 on 5/3/26.
//

import Foundation

struct SignupResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let meta: ErrorResponseDTO?
}

struct ErrorResponseDTO: Decodable {
    let path: String
    let timestamp: String
}

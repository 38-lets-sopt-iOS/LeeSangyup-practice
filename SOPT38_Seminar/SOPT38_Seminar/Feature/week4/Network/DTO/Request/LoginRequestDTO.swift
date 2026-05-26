//
//  LoginRequestDTO.swift
//  SOPT38_Seminar
//
//  Created by 이상엽 on 5/7/26.
//

import Foundation

struct LoginRequestDTO: Encodable {
    let loginId: String
    let password: String
}

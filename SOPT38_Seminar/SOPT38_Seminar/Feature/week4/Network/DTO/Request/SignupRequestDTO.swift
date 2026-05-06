//
//  SignupRequestDTO.swift
//  SOPT38_Seminar
//
//  Created by 이상엽 on 5/3/26.
//

import Foundation

struct SignupRequestDTO: Encodable {
    let loginId: String
    let password: String
    let name: String
    let email: String
    let age: Int
    let part: String
}

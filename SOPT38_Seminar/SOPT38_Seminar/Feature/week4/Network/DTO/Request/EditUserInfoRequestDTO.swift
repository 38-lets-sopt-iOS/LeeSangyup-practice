//
//  EditUserInfoRequestDTO.swift
//  SOPT38_Seminar
//
//  Created by 이상엽 on 5/7/26.
//

import Foundation

struct EditUserInfoRequestDTO: Encodable {
    let name: String
    let email: String
    let age: Int
}

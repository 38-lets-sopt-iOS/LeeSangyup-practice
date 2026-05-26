//
//  StoryChatView.swift
//  SOPT-38-SwiftUI
//
//  Created by 이상엽 on 5/16/26.
//

import SwiftUI

struct StoryChatView: View {
    let userList: UserModel

    var body: some View {
        HStack(spacing: 0) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
            
            VStack(spacing: 5) {
                Text(userList.name)
                
                Text(userList.message)
            }
            
            Spacer()
            
            Text("오전 09:41")
        }
        .padding()
    }
}

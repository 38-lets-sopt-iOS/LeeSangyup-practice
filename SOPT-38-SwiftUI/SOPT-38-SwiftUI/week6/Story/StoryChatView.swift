//
//  StoryChatView.swift
//  SOPT-38-SwiftUI
//
//  Created by 이상엽 on 5/16/26.
//

import SwiftUI

struct StoryChatView: View {
    let userList: UserModel
    let profileColor: Color
    let indicatorColor: Color
    let toggleAction: () -> Void

    var body: some View {
        HStack(spacing: 0) {
            ProfileButton(stateColor: indicatorColor, profileColor: profileColor, toggleAction: toggleAction)
                .padding(.trailing, 10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(userList.name)
                    .font(.headline)
                
                Text(userList.message)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Text("오전 09:41")
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .padding()
    }
}


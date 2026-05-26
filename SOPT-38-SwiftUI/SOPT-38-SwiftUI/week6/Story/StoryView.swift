//
//  StoryView.swift
//  SOPT-38-SwiftUI
//
//  Created by 이상엽 on 5/16/26.
//

import SwiftUI

struct StoryView: View {
    @Binding var activeState: [Bool]
    
    let userList: [UserModel]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(userList.indices, id: \.self) { index in
                    ProfileButton(stateColor: activeState[index] ? .green : .gray, profileColor: activeState[index] ? .blue : .gray, toggleAction: { activeState[index].toggle() })
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}


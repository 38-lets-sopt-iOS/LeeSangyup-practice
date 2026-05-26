//
//  totalView.swift
//  SOPT-38-SwiftUI
//
//  Created by 이상엽 on 5/16/26.
//

import SwiftUI

struct TotalView: View {
    @State private var activeStates: [Bool] = [true, false, false, true, false]
    
    var body: some View {
        VStack(spacing: 0) {
            StoryView(activeState: $activeStates, userList: UserModel.users)
                .padding()
            StroyChatListView(activeState: $activeStates, userLists: UserModel.users)
        }
    }
}

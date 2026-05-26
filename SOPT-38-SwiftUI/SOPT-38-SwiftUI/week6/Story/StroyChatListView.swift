//
//  StroyChatListView.swift
//  SOPT-38-SwiftUI
//
//  Created by 이상엽 on 5/16/26.
//

import SwiftUI

struct StroyChatListView: View {
    @Binding var activeState: [Bool]

    let userLists: [UserModel]
    
    var body: some View {
        List {
            ForEach(userLists.indices, id: \.self) { index in
                StoryChatView(
                    userList: userLists[index],
                    profileColor: activeState[index] ? .blue : .gray, indicatorColor: activeState[index] ? .green : .gray,
                    toggleAction: { activeState[index].toggle() }
                )
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.visible)
            }
        }
        .listStyle(.plain)
    }
}

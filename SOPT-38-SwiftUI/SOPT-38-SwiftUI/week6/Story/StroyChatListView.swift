//
//  StroyChatListView.swift
//  SOPT-38-SwiftUI
//
//  Created by 이상엽 on 5/16/26.
//

import SwiftUI

struct StroyChatListView: View {
    let userLists: [UserModel]
    
    var body: some View {
        List(userLists) { userList in
            StoryChatView(userList: userList)
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.visible)
        }
        .listStyle(.plain)
    }
}


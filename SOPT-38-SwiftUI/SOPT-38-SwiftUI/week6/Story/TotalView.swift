//
//  totalView.swift
//  SOPT-38-SwiftUI
//
//  Created by 이상엽 on 5/16/26.
//

import SwiftUI

struct TotalView: View {
    var body: some View {
        VStack(spacing: 0) {
            StroyChatListView(userLists: UserModel.users)
        }
    }
}

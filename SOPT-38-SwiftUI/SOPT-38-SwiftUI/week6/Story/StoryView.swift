//
//  StoryView.swift
//  SOPT-38-SwiftUI
//
//  Created by 이상엽 on 5/16/26.
//

import SwiftUI

struct StoryView: View {
    @State private var isSelectedProfile = false
    let userList: UserModel
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                Button {
                    isSelectedProfile.toggle()
                } label: {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
            }
        }
    }
}

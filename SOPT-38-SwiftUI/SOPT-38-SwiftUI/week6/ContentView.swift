//
//  ContentView.swift
//  SOPT-38-SwiftUI
//
//  Created by 이상엽 on 5/16/26.
//

import SwiftUI

struct ChatView: View {
    
    let chatList: ChatListModel
    
    var body: some View {
        VStack {
            HStack {
                Image(chatList.profileImage)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40)
                    .padding(.leading, 20)
                
                VStack {
                    HStack(spacing: 1) {
                        Text(chatList.name)
                            .font(.headline)
                        
                        Text(chatList.location)
                            .foregroundStyle(.gray)
                    }
                    Text(chatList.lastMessage)
                }
                
                Spacer()
                
                Image(chatList.productImage)
                    .resizable()
                    .frame(width: 70, height: 70)
            }
            .padding(.trailing, 20)
        }
    }
}

struct SampleListView: View {
    let items = ["사과", "바나나", "오렌지", "포도", "수박", "망고", "어쩌고", "저쩌고", "졸려요"]

    var body: some View {
        List(items, id: \.self) { item in
            Text(item)
        }
    }
}

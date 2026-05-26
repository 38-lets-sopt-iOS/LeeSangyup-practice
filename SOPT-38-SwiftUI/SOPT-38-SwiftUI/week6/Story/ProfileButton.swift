//
//  ProfileButton.swift
//  SOPT-38-SwiftUI
//
//  Created by 이상엽 on 5/26/26.
//

import SwiftUI

struct ProfileButton: View {
    let stateColor: Color
    let profileColor: Color
    
    var toggleAction: () -> Void
    
    var body: some View {
        Button {
            toggleAction()
        } label: {
            ZStack(alignment: .bottomTrailing) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundStyle(profileColor)
                
                Circle()
                    .foregroundStyle(stateColor)
                    .frame(width: 10, height: 10)
            }
        }
    }
}

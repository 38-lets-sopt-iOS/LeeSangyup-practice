//
//  LazyVGridView.swift
//  SOPT-38-SwiftUI
//
//  Created by 이상엽 on 5/23/26.
//

import SwiftUI

struct LazyVGridView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0...20, id: \.self) { value in
                    ZStack(alignment: .center) {
                        Rectangle()
                            .foregroundStyle(.blue)
                            .cornerRadius(8)
                        
                        VStack(spacing: 16) {
                            Rectangle()
                                .frame(height: 100)
                                .cornerRadius(8)
                                .foregroundStyle(.cyan)
                            
                            Text(String(format: "%x", value))
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    LazyVGridView()
}

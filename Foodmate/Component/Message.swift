//
//  Message.swift
//  Foodmate
//
//  Created by 박근경 on 2024/03/29.
//

import SwiftUI

struct Message: View {
    let My: Bool
    @State var InputMessage: String
    
    var body: some View {
        HStack {
            if (My) {
                Spacer()
            }
            
            Text(InputMessage)
                .font(.Pretendard(.bold, size: 14))
                .padding(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.customred, lineWidth: 1)
                )
                .padding(.horizontal,25)
            if (!My) {
                Spacer()
            }
        }
        .padding(.top, 2)
    }
}


#Preview {
    Message(My: true, InputMessage: "안녕하세요.")
}

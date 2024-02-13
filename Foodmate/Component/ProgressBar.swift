//
//  ProgressBar.swift
//  Foodmate
//
//  Created by 박근경 on 2024/01/10.
//

import SwiftUI

struct ProgressBar: View {
    var body: some View {
        ProgressView(value: 0.5)
            .progressViewStyle(PinkProgressView(value: "50%"))
    }
}

struct PinkProgressView : ProgressViewStyle {
    var value: String
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            ProgressView(configuration)
                .padding(.horizontal, 46)
                .progressViewStyle(LinearProgressViewStyle(tint: Color("custompink")))
                .shadow(radius: 2, x:0, y:1)
            Text(value)
                .frame(width: 300, alignment: .trailing)
                .font(.Pretendard(.regular, size: 12))
                .foregroundColor(Color("customgray"))
        }
    }
}
#Preview {
    ProgressBar()
}

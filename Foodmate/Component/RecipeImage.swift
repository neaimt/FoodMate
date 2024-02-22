//
//  RecipeImage.swift
//  Foodmate
//
//  Created by 박근경 on 2024/02/22.
//

import SwiftUI

// MARK: 레시피 이미지 뷰
struct ImageView: View {
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Image("FeedImage")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height)
            .clipped()
            .clipShape(
                .rect(
                    topLeadingRadius: 10,
                    bottomLeadingRadius: 10,
                    bottomTrailingRadius: 10,
                    topTrailingRadius: 10)
            )
            .shadow(radius: 2)
    }
}
#Preview {
    ImageView(width: 100, height: 100)
}

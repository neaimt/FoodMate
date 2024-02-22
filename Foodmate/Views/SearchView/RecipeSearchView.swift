//
//  RecipeSearchView.swift
//  Foodmate
//
//  Created by 박근경 on 2024/02/22.
//

import SwiftUI

// 추천 요리 배열


struct RecipeSearchView: View {
    @State var InputMenu: String = ""
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(.custompink)
                    .frame(height: 150)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 0,
                            bottomLeadingRadius: 15,
                            bottomTrailingRadius: 15,
                            topTrailingRadius: 0)
                    )
                
                VStack {
                    HStack {
                        Text("레시피 검색")
                            .font(.Pretendard(.semibold, size: 18))
                            .foregroundStyle(Color.white)
                        
                        Image(systemName: "fork.knife")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10)
                            
                    }
                    // MARK: 메뉴 검색칸
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                        TextField("만들고 싶은 요리를 검색해주세요 !", text: $InputMenu)
                            .font(.Pretendard(.regular, size: 12))
                            .multilineTextAlignment(.center)
                            .disableAutocorrection(true)
                            .onSubmit {
                                InputMenu = ""
                            }
                        
                    }
                    .frame(height: 35)
                    .padding(.horizontal, 15)
                }
                .padding(.top, 40)
            }
            .ignoresSafeArea()
            
            ZStack {
                Rectangle()
                    .fill(.white.shadow(.inner(radius: 3)).opacity(0.1))
                
                VStack(alignment: .leading) {
                    Text("추천 요리")
                        .font(.Pretendard(.regular, size: 12))
                        .padding(.leading, 20)
                        
                    HStack {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 5)
                            .padding(.leading, 3)
                        
                        ScrollView([.horizontal], showsIndicators: false) {
                            HStack {
                                ForEach(0..<5) { _ in
                                    ImageView(width: 100, height: 100)
                                        .padding(7)
                                }
                            }
                        }
                        
                        Image(systemName: "chevron.right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 5)
                            .padding(.trailing, 3)
                    }
                }
                .foregroundStyle(Color.customgray)
            }
            .frame(height: 160)
            
            Spacer()
        }
    }
}

#Preview {
    RecipeSearchView()
}

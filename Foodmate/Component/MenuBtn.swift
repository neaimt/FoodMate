//
//  MenuBtn.swift
//  Foodmate
//
//  Created by 박근경 on 2024/03/13.
//

import SwiftUI

struct MenuBtn: View {
    var  menuname: String
    @State var isMark: Bool = false // 찜 상태
    
    var body: some View {
        
        NavigationLink {
            MenuView()
        } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                        .frame(height: 120)
                        .shadow(color: Color(hue: 0.035, saturation: 0.0, brightness: 0.0, opacity: 0.2), radius: 2, x: 0, y:0)
                    HStack {
                        ImageView(width: 100, height: 100)
                            .padding(.leading, 10)
                        Spacer()
                            .frame(width: 15)
                        VStack(alignment: .leading){
                            Text(menuname)
                                .padding(.top, 12)
                                .font(.Pretendard(.semibold, size: 16))
                            Spacer()
                                .frame(height: 10)
                            Text("[재료]")
                            Text("계란, 당근, 우 후춧가루, 쪽파, 소금, 설탕")
                                .padding(.bottom, 5)
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("[소요시간]")
                                    Text("약 1시간")
                                }
                                VStack(alignment: .leading) {
                                    Text("[난이도]")
                                    Text("쉬움")
                                }
                                Spacer()
                                
                                isMark ? Image(systemName: "heart.fill") : Image(systemName: "heart")
                                
                            }
                            Spacer()
                        }
                        .frame(height: 120)
                        .font(.Pretendard(.regular, size: 10))
                        .foregroundStyle(Color.black)
                        Spacer()
                        Spacer()
                    }
                }
                .padding(.horizontal, 25)
            }
            .frame(height: 120)
        
    }
}

#Preview {
    MenuBtn(menuname: "계란말이")
}

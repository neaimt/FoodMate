//
//  MenuView.swift
//  Foodmate
//
//  Created by 박근경 on 2024/03/15.
//

import SwiftUI

struct MenuView: View {
    var menuname: String = "계란말이"
    @State var isMark: Bool = false
    
    var body: some View {
        VStack {
            Header(title: "레시피")
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .shadow(color: Color(hue: 0.035, saturation: 0.0, brightness: 0.0, opacity: 0.2), radius: 2, x: 0, y:0)
                    .padding(25)
                
                VStack(alignment: .leading){
                    ZStack {
                        Rectangle()
                            .fill(Color.customwhitegray)
                            .frame(height: 130)
                            .clipShape(
                                .rect(
                                    topLeadingRadius: 20,
                                    bottomLeadingRadius: 0,
                                    bottomTrailingRadius: 0,
                                    topTrailingRadius: 20)
                            )
                            .padding(25)
                        HStack {
                            ImageView(width: 100, height: 100)
                                .padding(.leading, 10)
                            Spacer()
                                .frame(width: 15)
                            VStack(alignment: .leading){
                                HStack {
                                    Text(menuname)
                                        .padding(.top, 12)
                                        .font(.Pretendard(.semibold, size: 16))
                                    Spacer()
                                    
                                    Button {
                                        isMark.toggle()
                                    } label: {
                                        isMark ?
                                        Image(systemName: "heart.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 15)
                                        :
                                        Image(systemName: "heart")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 15)
                                    }
                                    .padding(.top, 10)
                                }
                                Spacer()
                                    .frame(height: 10)
                                
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("[소요시간]")
                                        Text("약 1시간")
                                    }
                                    VStack(alignment: .leading) {
                                        Text("[난이도]")
                                        Text("쉬움")
                                    }
                                    
                                }
                                Spacer()
                            }
                            .frame(height: 120)
                            .font(.Pretendard(.regular, size: 10))
                            .foregroundStyle(Color.black)
                            Spacer()
                            Spacer()
                        }
                        .padding(.horizontal, 30)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("재료")
                            .font(.Pretendard(.semibold, size: 18))
                        Text("계란, 당근, 우 후춧가루, 쪽파, 소금, 설탕")
                            .font(.Pretendard(.regular, size: 14))
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 40)
                    
                    
                    VStack(alignment: .leading) {
                        Text("조리법")
                            .font(.Pretendard(.semibold, size: 18))
                        Text("먼저 계란 4개는 볼에 넣어주세요.그리고 설탕 1/2작은술과 소금도 1작은술 넣어주고부드러운 계란말이 팁은 우유를 계란 갯수만큼 4큰술 넣어주세요.우유가 없으면 물을 넣어도 좋고 후춧가루를 넣어 비린내도 잡아주세요.\n\n이제 계란이 잘 풀리도록 섞어주세요.우유를 넣어주면 훨씬 부드럽게 잘 섞여요.체에 한번 걸러서 사용해도 부드럽고 좋아요.\n\n계란말이 안에 넣어줄 부재료는 취향껏 준비하는데요저는 색감을 위한 당근과 쪽파를 송송 썰어주었어요.당근은 잘잘게 썰어줘야 잘 익어요.\n\n이제 계란을 풀어놓은 볼에 넣고 잘 섞어주세요.\n\n팬에 기름을 살짝 둘러 키친타월로 꼼꼼히 닦아준 후 계란물을 부어주세요.다 붓지 않고 1/3~1/4정도의 양을 부어주세요.")
                            .font(.Pretendard(.regular, size: 14))
                    }
                    .padding(.horizontal, 40)
                    Spacer()
                }
            }
            
            Spacer()
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MenuView()
}

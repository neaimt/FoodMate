//
//  MypageView.swift
//  Foodmate
//
//  Created by 박근경 on 2024/04/01.
//

import SwiftUI

struct MypageView: View {
    @State var changeInfo: Bool = false // 개인정보 수정 모달창
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom){
                Rectangle()
                    .fill(.customred)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 0,
                            bottomLeadingRadius: 15,
                            bottomTrailingRadius: 15,
                            topTrailingRadius: 0)
                    )
                VStack(alignment: .leading) {
                    Text("Mate")
                        .font(.Pretendard(.semibold, size: 24))
                        .foregroundStyle(Color.white)
                        .padding(.leading, 10)
                        .offset(y:15)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .stroke(Color.red, lineWidth: 2)
                            .frame(height: 80)
                            
                        
                        HStack {
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .stroke(Color.customwhitegray)
                                    .frame(width: 50, height: 50)
                                
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20)
                                    .foregroundStyle(Color.black)
                                
                            }// 사람 이미지
                            VStack(alignment: .leading) {
                                Text("Neaim님")
                                    .font(.Pretendard(.semibold, size:18))
                                
                                Button {
                                    changeInfo = true
                                } label: {
                                    Text("개인 정보 수정하러 가기 >")
                                        .font(.Pretendard(.bold, size:14))
                                        .foregroundStyle(Color.gray)
                                }
                                .fullScreenCover(isPresented: $changeInfo, content: {
                                    Text("수정화면")
                                        .onTapGesture {
                                            changeInfo.toggle()
                                        }
                                })
                            }
                            .padding(.leading, 10)
                            Spacer()
                        }
                        .padding(.leading, 15)
                    }
                    .padding(.bottom, 20)
                }
                .padding(.horizontal, 30)
            }
            .frame(height: 200)
            .padding(.bottom, 20)
            
            
            HStack {
                NavigationLink {
                    Text("dd")
                } label: {
                    PageBtn(pageNo: page[0])
                }
                NavigationLink {
                    Text("dd")
                } label: {
                    PageBtn(pageNo: page[1])
                }
                NavigationLink {
                    RefrigeratorView()
                } label: {
                    PageBtn(pageNo: page[2])
                }
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.customred, lineWidth: 2)
                HStack {
                    Image("Logo_black")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                        .padding(.leading, 20)
                    Spacer()
                    NavigationLink {
                        Text("Dd")
                    } label: {
                        Text("FoodMate 사용법 보러가기 >")
                            .font(.Pretendard(.bold, size: 12))
                            .foregroundStyle(Color.black)
                    }
                    .padding(.trailing, 20)
                }
            }
            .frame(height: 60)
            .padding(.horizontal, 35)
            .padding(.top, 4)
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MypageView()
}

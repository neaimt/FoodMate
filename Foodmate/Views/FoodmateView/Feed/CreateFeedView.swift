//
//  CreateFeedView.swift
//  Foodmate
//
//  Created by 박근경 on 2024/02/20.
//

import SwiftUI

struct CreateFeedView: View {
    @Binding var feedList: [Feed]
    @Environment(\.presentationMode) var presentationMode
    
    @State var Inputtitle: String = ""
    @State var Inputcontent: String = ""

    var body: some View {
        VStack {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                Rectangle()
                    .fill(.white.shadow(.drop(color: Color(hue: 0.035, saturation: 0.0, brightness: 0.0, opacity: 0.1), radius: 3, x:0, y:1)))
                    .frame(height: 99)
                
                HStack(alignment: .center) {
                    Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundStyle(Color.custommiddlegray)
                            .frame(width: 20, height: 20)
                            .rotationEffect(.degrees(-45))
                            .padding(.leading, 10)
                    })
                    Spacer()
                }
                .padding(.bottom, 10)
                Text("게시물 작성")
                    .font(.Pretendard(.medium, size: 14))
                    .padding(.bottom, 10)
            }
            .frame(height: 100)

            
            VStack {
                TextField("제목", text: $Inputtitle)
                    .frame(height: 30)
                    .font(.Pretendard(.bold, size: 16))
                    .foregroundStyle(Color.black)

                Divider()
                
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                    TextEditor(text: $Inputcontent)
                        .font(.Pretendard(.bold, size: 14))
                        .foregroundStyle(Color.black)
                        .multilineTextAlignment(.leading)
                }
                .frame(height: 300)

                Divider()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("필수 기재 사항")
                            .font(.Pretendard(.semibold, size: 16))
                            .padding(.bottom, 10)
                        
                        HStack {
                            Text("메뉴")
                                .font(.Pretendard(.semibold, size: 12))
                        }
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("배달비")
                                .font(.Pretendard(.semibold, size: 12))
                            
                        }
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("주문시간")
                                .font(.Pretendard(.semibold, size: 12))
                            
                        }
                        .padding(.bottom, 10)
                        
                        Text("푸드메이트와의 거리")
                            .font(.Pretendard(.semibold, size: 12))
                        Spacer()
                    }
                    .foregroundStyle(Color.customgray)
                    
                    Spacer()
                }
                .frame(height: 180)

                Divider()
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            Spacer()
            ZStack(alignment: Alignment(horizontal: .center, vertical: .center)){
                Rectangle()
                    .fill(.white.shadow(.drop(color: Color(hue: 0.035, saturation: 0.0, brightness: 0.0, opacity: 0.1), radius: 3, x:0, y:1)))
                    .frame(height: 50)
                
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "camera")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                            .padding(.leading, 40)
                            .foregroundStyle(Color.black)
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        feedList.append(Feed(nickname: "ss", date: "ss", title: Inputtitle, content: Inputcontent, menu: "ss", deliveryFee: "ss", time: "ss"))
                        
                        presentationMode.wrappedValue.dismiss()
                        
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.custompink)
                                .frame(width: 50, height: 25)
                            
                            Text("완료")
                                .foregroundStyle(Color.white)
                                .font(.Pretendard(.semibold, size: 10))
                        }
                    })
                }
                .padding(.trailing, 40)
            }
            .frame(height: 50)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
}

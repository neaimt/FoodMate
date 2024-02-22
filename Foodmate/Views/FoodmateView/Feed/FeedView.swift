//
//  CreateFeedView.swift
//  Foodmate
//
//  Created by 박근경 on 2024/02/19.
//

import SwiftUI

struct FeedView: View {
    @State var isChat: Bool = false
    
    @State var InputFeed: String = ""
    @State var textHeight: CGFloat = 400
    
    var body: some View {
        VStack {
            Header(title: "")
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .top) ){
                Rectangle()
                    .fill(Color.white)
                    
                VStack(alignment: .leading) {
                    Text(FeedList[0].nickname)
                        .font(.Pretendard(.semibold, size:16))
                    
                    Text(FeedList[0].date)
                        .font(.Pretendard(.regular, size:8))
                    
                    Text(FeedList[0].title)
                        .font(.Pretendard(.semibold, size:16))
                    
                    Text(FeedList[0].content)
                        .font(.Pretendard(.regular, size:12))
                    
    
                    Image("FeedImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipped()
                        .shadow(radius: 1)
                        .padding(.top, 10)
                        .padding(.bottom, 20)
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)
            }
            .offset(CGSize(width: 0, height: -60.0))
            .frame(maxHeight: 300)
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                Rectangle()
                    .fill(Color.customwhitegray)
                    .shadow(radius: 2)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("메뉴")
                            .padding(.bottom,3)
                        Text("배달비")
                            .padding(.bottom,3)
                        Text("예상 주문시간")
                    }
                    .font(.Pretendard(.regular, size: 12))
                    .padding()
                    
                    VStack(alignment: .leading) {
                        Text("･ \(FeedList[0].menu)")
                            .padding(.bottom,3)
                        Text("･ \(FeedList[0].deliveryFee)")
                            .padding(.bottom,3)
                        Text("･ \(FeedList[0].time)")
                    }
                    .font(.Pretendard(.regular, size: 12))
                    .padding()
                }
            }
            .frame(height: 100)
            .offset(CGSize(width: 0, height: -68.0))
            
            Spacer()
            
            Button(action: {
                isChat.toggle()
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.custompink)
                        .frame(width: 115, height: 60)
                    
                    Image(systemName: "message")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30)
                        .foregroundStyle(Color.customgray.opacity(0.5))
                    
                    Text("채팅 보내기")
                        .foregroundStyle(Color.white)
                        .font(.Pretendard(.semibold, size: 15))
                }
            })
            .fullScreenCover(isPresented: $isChat, content: {
                ChatSendBoxView(isChat: $isChat)
                    .ignoresSafeArea()
                    .background(ClearBackground())
            })
        }
        .navigationBarBackButtonHidden()
    }
}

struct ChatSendBoxView: View {
    @Binding var isChat: Bool
    @State var chating: Bool = false
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .strokeBorder(Color.custompink)
                .frame(width: 250, height: 180)
                
            VStack {
                Text("\(FeedList[0].nickname)님과\n채팅하시겠습니까?")
                    .font(.Pretendard(.semibold, size: 14))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10)
                
                HStack {
                    Button(action: {
                        isChat = false
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.customwhitegray)
                                .frame(width: 70, height: 40)
                            Text("아니오")
                                .foregroundStyle(Color.customgray)
                                .font(.Pretendard(.semibold, size: 12))
                        }
                        
                    })
                    Spacer()
                        .frame(width: 20)
                    
                    Button(action: {
                        chating.toggle()
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.custompink)
                                .frame(width: 70, height: 40)
                            Text("네")
                                .foregroundStyle(Color.white)
                                .font(.Pretendard(.semibold, size: 12))
                        }
                    })
                    .fullScreenCover(isPresented: $chating, content: {
                        Text("채팅 화면")
                            .onTapGesture {
                                chating.toggle()
                            }
                    })
                }
            }
        }
        .frame(width: 250, height: 180)
    }
}

// MARK: 목록에 나타날 피드뷰
struct FeedListView: View {
    // 피드 구조체에서 제목, 콘텐츠 일부, 사진 받아오기
    var title: String
    var subTitle: String
    
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .fill(.white)
                    .frame(height: 70)
                    .padding(.horizontal, 20)
                Divider()
                    .padding(.horizontal, 20)
            }
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.Pretendard(.semibold, size: 12))
                    
                    Text(subTitle)
                        .font(.Pretendard(.regular, size: 10))
                }
                .padding(.top, 8)
                .foregroundStyle(Color.black)
                
                Spacer()
                
                ImageView(width: 60, height: 60)
            }
            .padding(.horizontal, 30)
        }
        .frame(height: 80)
    }
}

#Preview {
    FeedView()
}

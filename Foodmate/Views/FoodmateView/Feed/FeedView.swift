//
//  CreateFeedView.swift
//  Foodmate
//
//  Created by 박근경 on 2024/02/19.
//

import SwiftUI

struct FeedView: View {
    @State var isChat: Bool = false
    @State var feed: Feed
    
    var body: some View {
        VStack {
            Header(title: "")
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .top) ){
                Rectangle()
                    .fill(Color.white)
                    
                VStack(alignment: .leading) {
                    Text(feed.nickname)
                        .font(.Pretendard(.semibold, size:16))
                    
                    Text(feed.date)
                        .font(.Pretendard(.regular, size:8))
                    
                    Text(feed.title)
                        .font(.Pretendard(.semibold, size:16))
                    
                    Text(feed.content)
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
                        Text("･ \(feed.menu)")
                            .padding(.bottom,3)
                        Text("･ \(feed.deliveryFee)")
                            .padding(.bottom,3)
                        Text("･ \(feed.time)")
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
                ChatSendBoxView(feed: $feed, isChat: $isChat)
                    .ignoresSafeArea()
                    .background(ClearBackground())
            })
        }
        .navigationBarBackButtonHidden()
    }
}

struct ChatSendBoxView: View {
    @Binding var feed: Feed
    @Binding var isChat: Bool
    @State var chating: Bool = false
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .strokeBorder(Color.custompink)
                .frame(width: 250, height: 180)
                
            VStack {
                Text("\(feed.nickname)님과\n채팅하시겠습니까?")
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
                    
//                        postCreateChatroom(userId: feed.nickname, postId: feed.postId, participantId: "participantId") { result in
//                            switch result {
//                            case .success(let chatroom):
//                                // 응답으로 받은 Chatroom 객체를 직접 처리
//                                
//                                ChatRoom.append(Chatroom(chatRoomId: chatroom.chatRoomId, userId: chatroom.userId, participantId: chatroom.participantId))
//                                
//                                print("Chatroom created successfully!")
//                                print("Chatroom ID: \(chatroom.chatRoomId)")
//                                print("User ID: \(chatroom.userId)")
//                                print("Participant ID: \(chatroom.participantId)")
//                                // 여기에 후속 작업을 추가하세요 (예: UI 업데이트)
//                            case .failure(let error):
//                                print("Error creating chatroom: \(error)")
//                            }
//                        }

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
                        ChatRoomView(chatInfo: ChatRoom[0])
                            .onDisappear {
                                isChat.toggle()
                            }
                    })
                }
            }
        }
        .frame(width: 250, height: 180)
    }
}

#Preview {
    FeedView(feed: FeedList[0])
}

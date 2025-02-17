//
//  ChatListView.swift
//  Foodmate
//
//  Created by 박근경 on 2024/03/29.
//

import SwiftUI
var ChatRoom: [Chatroom] = [Chatroom(chatRoomId: 1, userId: "user123", participantId: "전서현")]

struct ChatListView: View {
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
                Text("채팅")
                    .font(.Pretendard(.semibold, size: 20))
                    .foregroundStyle(Color.white)
                    .padding(.bottom, 20)
            }
            .frame(height: 120)
            .padding(.bottom, 20)
            ScrollView {
                VStack {
                    ForEach(ChatRoom, id: \.self) { chat in
                        ChatRow(chatInfo: chat)
                    }
                }
            }
            .padding(.bottom, 100)
            Spacer()
        }
        .background(Image("Logo_pink"))
        .ignoresSafeArea()
//        .onAppear {
//            getChatrooms(userId: "user123") { result in
//                switch result {
//                case .success(let chatrooms):
//                    // 반환된 Chatroom 배열을 처리 + 배열에 추가햐애함
//                    print("Chatrooms fetched successfully!")
//                    
//                    for chatroom in chatrooms {
//                        ChatRoom.append(Chatroom(chatRoomId: chatroom.chatRoomId, userId: chatroom.userId, participantId: chatroom.participantId))
//                        
//                        print("Chatroom ID: \(chatroom.chatRoomId)")
//                        print("User ID: \(chatroom.userId)")
//                        print("Participant ID: \(chatroom.participantId)")
//                        print("Post ID: \(chatroom.postId ?? 1)")
//                    }
//                    
//                case .failure(let error):
//                    print("Error fetching chatrooms: \(error)")
//                }
//            }
//        }
    }
}



#Preview {
    ChatListView()
}

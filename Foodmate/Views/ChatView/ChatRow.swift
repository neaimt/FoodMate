//
//  ChatRow.swift
//  Foodmate
//
//  Created by 박근경 on 2024/03/29.
//

import SwiftUI

struct ChatRow: View {
    var chatInfo: Chatroom
    
    var body: some View {
        ZStack {
            NavigationLink {
                ChatRoomView(chatInfo: chatInfo)
            } label: {
                HStack{
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .stroke(Color.customgray)
                            .frame(width: 40, height: 40)
                        
                        Image(systemName: "person.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15)
                            .foregroundStyle(Color.black)
                        
                    }// 사람 이미지
                    VStack(alignment: .leading) {
                        Text(chatInfo.participantId)
                            .font(.Pretendard(.semibold, size:15))
                            .foregroundStyle(Color.black)
                        Spacer()
                            .frame(height: 5)
                        Text("안녕하세요.")
                            .font(.Pretendard(.regular, size:13))
                            .foregroundStyle(Color.black)
                    } // 이름, 채팅 내용
                    Spacer()
                    
                }
                .padding(.leading, 15)
            }
            
            HStack {
                Spacer()
                VStack{
                    Button {
                        ChatRoom.removeAll()
                    } label: {
                        ZStack {
                            Rectangle()
                                .fill(Color.custompink)
                                .frame(width: 50, height: 30)
                            Text("나가기")
                                .font(.Pretendard(.semibold, size: 12))
                                .foregroundStyle(Color.white)
                        }
                        .padding(.trailing, 10)
                    }
                    Spacer()
                }
            }
        }
        .frame(height: 50)
        Divider()
    }
}

#Preview {
    ChatRow(chatInfo: ChatRoom[0])
}

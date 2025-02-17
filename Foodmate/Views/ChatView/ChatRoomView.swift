//
//  ChatRoomView.swift
//  Foodmate
//
//  Created by 박근경 on 2024/03/29.
//

import SwiftUI
struct MSG: Hashable {
    var text: String
    var My: Bool
}
struct ChatRoomView: View {
    var chatInfo: Chatroom
    
    @Namespace var bottomID
    @State var InputMsg: String=""
    @State var chatMsg: [MSG] = [
        MSG(text: "안녕하세요!", My: true),
        MSG(text: "안녕하세요.", My: false),
        MSG(text: "반가워요.", My: false),
        MSG(text: "화양동 근처에서 주문 가능할까요?", My: true),
        MSG(text: "네네 좋아요.", My: false)
    ]
    
    var body: some View {
        VStack {
            Header(title: "전서현")
                .overlay {
                    Rectangle()
                        .fill(Color.custompink)
                        .opacity(0.2)
                }
            ScrollViewReader { proxy in
                ScrollView {
                    ForEach(chatMsg, id:\.self) { msg in
                        Message(My: msg.My, InputMessage: msg.text)
                    }
                }

                Spacer()
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                    Rectangle()
                        .fill(Color.custompink)
                        .frame(height: 95)
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .frame(height: 40)
                            
                            TextField("", text: $InputMsg)
                                .padding(.leading, 10)
                            
                        }
                        .padding(.leading, 10)
                        
                        Spacer()
                        
                        Button {
                            if (InputMsg != "" ) {
                                chatMsg.append(MSG(text: InputMsg, My: true))
                                InputMsg = ""
                            }
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                    .frame(height: 40)
                                
                                Text("전송")
                                    .foregroundStyle(Color.customred)
                                    .font(.Pretendard(.semibold, size: 16))
                                    .padding(.horizontal,20)
                            }
                            .fixedSize()
                            .padding(.trailing, 10)
                        }
                    }
                    .padding(.top, 10)
                }
            }
        }
        .background(Image("Logo_pink"))
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
}
var msg: [String] = ["안녕하세요", "반가워요", "잘있어요", "다시 만나요!", "안녕하세요. 근처 화양동 사는 박근경입니다.\n혹시 같이 주문가능할까요?"]

#Preview {
    ChatRoomView(chatInfo: ChatRoom[0])
}

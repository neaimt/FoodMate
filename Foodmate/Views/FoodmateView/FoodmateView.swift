//
//  FoodmateView.swift
//  Foodmate
//
//  Created by 박근경 on 2024/02/18.
//

import SwiftUI
struct FoodmateView: View {
    @State var InputMenu: String = ""
    @State var Address: String = "화양동"
    
    @State var isShowing: Bool = false
    var Boundary: [String] = ["100", "200", "300", "400", "500"]
    @State var selectedBoundary: Int = 0
    
    var body: some View {
        NavigationStack {
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
                    
                    // MARK: 주소 칸
                    VStack {
                        HStack {
                            Text(Address)
                                .font(.Pretendard(.semibold, size: 18))
                                .foregroundStyle(Color.white)
                                .padding(.leading, 20)
                            Button {
                                print("주소화면")
                            } label: {
                                Image(systemName: "chevron.down")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundStyle(Color.white)
                                    .frame(width: 15)
                            }
                            Spacer()
                        }
                        // MARK: 메뉴 검색칸
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
                            TextField("메이트와 같이 먹고 싶은 음식을 입력해주세요", text: $InputMenu)
                                .font(.Pretendard(.regular, size: 12))
                                .multilineTextAlignment(.center)
                            
                        }
                        .frame(height: 35)
                        .padding(.horizontal, 15)
                    }
                    .padding(.top, 30)
                }
                // MARK: 범위 설정 칸
                HStack {
                    Menu {
                        ForEach(0..<Boundary.count, id: \.self) { index in
                            Button {
                                selectedBoundary = index
                            } label: {
                                Text(Boundary[index])
                            }
                        }
                        .frame(width: 100)
                    } label : {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.customwhitegray)
                                .frame(width: 80, height: 40)
                            HStack {
                                Text("범위")
                                    .font(.Pretendard(.regular, size: 14))
                                    .foregroundStyle(Color.black)
                                Image(systemName: "chevron.down")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundStyle(Color.custommiddlegray)
                                    .frame(width: 15)
                            }
                        }
                        .padding(.leading, 15)
                    }
                    
                    Spacer()
                    
                    Text("\(Boundary[selectedBoundary])m 이내")
                        .font(.Pretendard(.regular, size: 12))
                        .padding(.trailing, 20)
                }
                .padding(.top, 10)
                
                NavigationLink(destination: Text("게시글")) {
                    FeedListView()
                    
                }
                Spacer()
            }
            .ignoresSafeArea()
        }
    }
}

struct FeedListView: View {
    @State var title: String = ""
    @State var subTitle: String = ""
    
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
                    Text("뿌링클 치킨 같이 먹을 사람 구합니다 !")
                        .font(.Pretendard(.semibold, size: 12))
                    
                    Text("화양지점이고, 순살로 시킬 예정")
                        .font(.Pretendard(.regular, size: 10))
                }
                .padding(.top, 8)
                .foregroundStyle(Color.black)
                
                Spacer()
                
                Image("FeedImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 10,
                            bottomLeadingRadius: 10,
                            bottomTrailingRadius: 10,
                            topTrailingRadius: 10)
                    )
                    .shadow(radius: 2)
            }
            .padding(.horizontal, 30)
        }
        .frame(height: 80)
    }
}

#Preview {
    FoodmateView()
}

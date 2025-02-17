//
//  FoodmateView.swift
//  Foodmate
//
//  Created by 박근경 on 2024/02/18.
//

import SwiftUI

struct FoodmateView: View {
    @State var feedList: [Feed] = FeedList
    
    @State var InputMenu: String = ""
    @State var Address: String = "주소"
    
    @State var isShowing: Bool = false
    var Boundary: [String] = ["100", "200", "300", "400", "500"]
    @State var selectedBoundary: Int = 0
    
    var body: some View {
        VStack(alignment: .trailing) {
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
                            isShowing.toggle()
                        } label: {
                            Image(systemName: "chevron.down")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(Color.white)
                                .frame(width: 15)
                        }
                        .fullScreenCover(isPresented: $isShowing, content: {
                            AddressSearchView(Address: $Address)
                        })
                        Spacer()
                    }
                    // MARK: 메뉴 검색칸
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                        TextField("메이트와 같이 먹고 싶은 음식을 입력해주세요", text: $InputMenu)
                            .font(.Pretendard(.regular, size: 12))
                            .multilineTextAlignment(.center)
                            .disableAutocorrection(true)
                            .onSubmit {
                                InputMenu = ""
                            }
                        
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
            
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                ScrollView {
                    ForEach(feedList, id: \.self) { feed in
                        NavigationLink(destination: FeedView(feed: feed)) {
                            FeedListView(title: feed.title, subTitle: feed.content)
                        }
                    }
                }
                
                AddFeedBtn(feedList: $feedList)
                    .offset(CGSize(width: -20.0, height: -90.0))
            }
        }
//        .onAppear {
//            getFoodmates { result in
//                switch result {
//                case .success(let foodmates):
//                    for foodmate in foodmates {
//                        feedList.append(Feed(nickname: foodmate.userid, date: "2024-05-23", postId: Int(foodmate.postid), title: foodmate.title ?? "", content: foodmate.body ?? "", menu: foodmate.deliveryFood ?? "", deliveryFee: "1000", time: "1시간"))
//                        
////                        print("Post ID: \(foodmate.postid), Title: \(foodmate.title ?? ""), Body: \(foodmate.body ?? ""), User ID: \(foodmate.userid), Created At: \(foodmate.time ?? Date()), Delivery Cost: \(foodmate.deliveryCost ?? 0), Delivery Time: \(foodmate.deliveryTime ?? 0), Delivery Food: \(foodmate.deliveryFood ?? "")")
//                    }
//                case .failure(let error):
//                    print("Error fetching foodmates: \(error)")
//                }
//            }
//        }
        .ignoresSafeArea()
    }
}

// MARK: 게시물 추가기능 버튼
struct AddFeedBtn: View {
    @Binding var feedList: [Feed]
    @State var moveCreateFeedView: Bool = false
    
    var body: some View {
        NavigationLink {
            CreateFeedView(feedList: $feedList)
        } label: {
            ZStack {
                Circle()
                    .stroke(Color.customgray)
                    .fill(Color.customwhitegray)
                    .frame(width: 50, height: 50)
                Image(systemName: "plus")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .foregroundStyle(Color.customgray)
            }
        }
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
    FoodmateView()
}

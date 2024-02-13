//
//  OnboardingView.swift
//  Foodmate
//
//  Created by 박근경 on 2024/02/02.
//

import SwiftUI
struct OnboardingView: View {
    let _title = ["냉장고에 재료를 추가하세요 !", "새로운 재료가 생겼나요 ?"]
    let _minititle = ["food mate가 추가된 재료로 음식을 추천해드릴게요", "상단의 + 버튼을 통해 냉장고에 재료를 채울 수 있어요!"]
    let _img = ["Obd1", "Obd1"]
    
    var body: some View {
        GeometryReader { geo in
            Header(title: "회원가입")
            VStack {
                TabView {
                    ForEach(0..<2) { index in
                        Explain(title: _title[index],mini_title: _minititle[index], img: _img[index])
                    }
                }
                .frame(width: geo.size.width, height: 500)
                .tabViewStyle(PageTabViewStyle())
                .onAppear{
                    setupAppearance()
                }
                HStack {
                    Btn(title: "재료 추가하기", color:"custompink", fontcolor: .white)
                    Spacer()
                        .frame(width: 15)
                    Btn(title: "나중에 채우기", color: "customwhitegray", fontcolor: .customgray)
                }
            }
            .padding(.top, 50)
    }
}
    
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
}
struct Explain: View {
    let title: String
    let mini_title: String
    let img: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.Pretendard(.semibold, size: 20))
            Text(mini_title)
                .font(.Pretendard(.medium, size: 10))
            
            Image(img)
                .padding(.top, 30)
        }
    }
}

struct Btn: View {
    let title: String
    let color: String
    let fontcolor: Color

    var body: some View {
        Button {
            
        } label: {
            NavigationLink {
                Text("d")
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(color))
                        .frame(width: 145, height: 60)
                    Text(title)
                        .foregroundStyle(fontcolor)
                        .font(.Pretendard(.semibold, size: 16))
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    OnboardingView()
}

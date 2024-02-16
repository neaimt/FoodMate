//
//  CustomTabBarView.swift
//  Foodmate
//
//  Created by 박근경 on 2024/02/15.
//

import SwiftUI

struct CustomTabBarView: View {
    let tabs: [TabBarItem]
    @Namespace private var namespace
    @State var localSelection: TabBarItem
    @Binding var selection: TabBarItem
    
    var body: some View {
        tabBarVersion1
            .onChange(of: selection, { oldValue, newValue in
                localSelection = newValue
            })
    }
}

extension CustomTabBarView {
    // 탭바 아이템 한개의 뷰
    private func tabView(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            
            Text(tab.title)
                .font(.Pretendard(.medium, size: 10))
        }
        .foregroundColor(localSelection == tab ? Color.custompink : Color.custommiddlegray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
    }
    
    private func switchToTab(tab: TabBarItem) {
        selection = tab
    }
    
    private var tabBarVersion1: some View {
        HStack {
            ForEach(tabs, id:\.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
        .background(Color.white)
        .frame(maxWidth: .infinity)
        .clipShape(
            .rect(
                topLeadingRadius: 15,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: 15
            )
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 0.1)
        )
        
    }
}

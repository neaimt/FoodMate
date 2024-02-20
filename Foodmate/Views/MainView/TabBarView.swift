//
//  TabBarView.swift
//  Foodmate
//
//  Created by 박근경 on 2024/02/15.
//

import SwiftUI

struct TabBarView: View {
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
        NavigationStack {
            CustomTabBarContainerView(selection: $tabSelection) {
                Text("검색")
                    .tabBarItem(tab: .search, selection: $tabSelection)
                FoodmateView()
                    .tabBarItem(tab: .mate, selection: $tabSelection)
                MainView()
                    .tabBarItem(tab: .home, selection: $tabSelection)
                Text("채팅")
                    .tabBarItem(tab: .message, selection: $tabSelection)
                Text("마이페이지")
                    .tabBarItem(tab: .profile, selection: $tabSelection)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    TabBarView()
}

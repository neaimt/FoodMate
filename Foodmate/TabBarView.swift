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
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.red
                .tabBarItem(tab: .search, selection: $tabSelection)
            Color.red
                .tabBarItem(tab: .mate, selection: $tabSelection)
            MainView()
                .tabBarItem(tab: .home, selection: $tabSelection)
            Color.red
                .tabBarItem(tab: .message, selection: $tabSelection)
            Color.red
                .tabBarItem(tab: .profile, selection: $tabSelection)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    TabBarView()
}

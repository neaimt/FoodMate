//
//  CustomTabBarContainerView.swift
//  Foodmate
//
//  Created by 박근경 on 2024/02/15.
//

import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
    let content: Content
    @Binding var selection: TabBarItem
    @State private var tabs: [TabBarItem] = [.search, .mate, .home, .message, .profile]
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom, content: {
            content.ignoresSafeArea()
            CustomTabBarView(tabs: tabs, localSelection: selection, selection: $selection)
        })
        .onPreferenceChange(TabBarItemPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

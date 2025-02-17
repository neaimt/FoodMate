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
                RecipeSearchView()
                    .tabBarItem(tab: .search, selection: $tabSelection)
                FoodmateView()
                    .tabBarItem(tab: .mate, selection: $tabSelection)
//                    .onTapGesture {
//                        getFoodmates { result in
//                            switch result {
//                            case .success(let foodmates):
//                                for foodmate in foodmates {
//                                    print(foodmate)
//                                }
//                            case .failure(let error):
//                                print("Error fetching foodmates: \(error)")
//                            }
//                        }
//                    }
                

                MainView()
                    .tabBarItem(tab: .home, selection: $tabSelection)
                ChatListView()
                    .tabBarItem(tab: .message, selection: $tabSelection)
                MypageView()
                    .tabBarItem(tab: .profile, selection: $tabSelection)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    TabBarView()
}

//
//  MenuRecomandView.swift
//  Foodmate
//
//  Created by 박근경 on 2024/03/13.
//

import SwiftUI

struct MenuRecomandView: View {
    var body: some View {
        VStack {
            NavigationStack {
                VStack {
                    Header(title: "검색")
                        .padding(.bottom, 10)
                    
                    ForEach(menulist, id: \.self.menuname) { menu in
                        menu
                            .padding(.top, 10)
                    }
                    Spacer()
                }
                .ignoresSafeArea();
            }
        }
    }
}
var menulist: [MenuBtn] = [MenuBtn(menuname: "계란말이")]

#Preview {
    MenuRecomandView()
}

//
//  RefrigeratorView.swift
//  Foodmate
//
//  Created by 박근경 on 2024/05/05.
//

import SwiftUI
var UserRefrigerator: Refrigerator = Refrigerator(IngredientList: [])

struct RefrigeratorView: View {
    var body: some View {
        VStack {
            ForEach(AllRefrigerator.IngredientList, id: \.self) { str in
                Button {
                    plus(ingredient: str)
                } label: {
                    Text(str)
                }
            }
            Button {
                postRefrigerator(user: UserRefrigerator.IngredientList)
            } label: {
                Text("재료추가")
            }

        }
    }
    
    func plus(ingredient: String) {
        UserRefrigerator.IngredientList.append(ingredient)
        print(UserRefrigerator.IngredientList)
    }
}


#Preview {
    RefrigeratorView()
}

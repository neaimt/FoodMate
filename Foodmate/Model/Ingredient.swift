//
//  Ingredient.swift
//  Foodmate
//
//  Created by 박근경 on 2024/05/05.
//

import Foundation
// MARK: 임시 ! 재료 모델 따로 만들기!
public class ingredient: Identifiable {
    let name: String
    public var id = UUID()
    var isChecked: Bool
    
    init(name: String, id: UUID = UUID(), isChecked: Bool) {
        self.name = name
        self.id = id
        self.isChecked = isChecked
    }
}

// 여기다가 냉장고 재료 불러와야 함
public var listrow = [
    ingredient(name: "대파", isChecked: false),
    ingredient(name: "양파", isChecked: false),
    ingredient(name: "파프리카", isChecked: false),
    ingredient(name: "계란", isChecked: false),
    ingredient(name: "버섯", isChecked: false),
    ingredient(name: "마늘", isChecked: false),
    ingredient(name: "고추", isChecked: false),
    ingredient(name: "메론", isChecked: false),
    ingredient(name: "바나나", isChecked: false),
    ingredient(name: "키위", isChecked: false),
    ingredient(name: "쌀", isChecked: false),
    ingredient(name: "쪽파", isChecked: false),
    ingredient(name: "와사비", isChecked: false),
    ingredient(name: "배", isChecked: false),
    ingredient(name: "딸기", isChecked: false),
    ingredient(name: "현미", isChecked: false),
    ingredient(name: "고등어", isChecked: false),
    ingredient(name: "삼치", isChecked: false),
    ingredient(name: "당근", isChecked: false),
    ingredient(name: "사과", isChecked: false),
    ingredient(name: "갈비", isChecked: false),
    ingredient(name: "삼겹살", isChecked: false),
    ingredient(name: "오징어", isChecked: false),
    ingredient(name: "만두", isChecked: false)
]

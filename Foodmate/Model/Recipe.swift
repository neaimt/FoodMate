//
//  Recipe.swift
//  Foodmate
//
//  Created by 박근경 on 2024/05/26.
//

import Foundation

public struct Recipe: Codable {
    var userid: String
    var foodname: [String]
    var prefer: String
}

//
//  Feed.swift
//  Foodmate
//
//  Created by 박근경 on 2024/02/20.
//

import Foundation
import SwiftUI
// 게시된 피드 정보 받아와서 구조체 만들기 : 임시 구조체

struct Foodmate: Codable, Hashable {
    var postid: Int32
    var userid: String //
    
    var title: String? //
    var body: String? // content
    
    var time: Date? // 게시물 업로드한 시간 스트링으로 변환
    
    var lat: Decimal?
    var lng: Decimal?
    
    var deliveryCost: Float? // 스트링으로 변환
    var deliveryTime: Int? // 배달 시간 스트링으로 변환
    var deliveryFood: String? // 메뉴

}

struct Feed: Hashable {
    var nickname: String
    var date: String
    var postId: Int
    
    var title: String
    var content: String
    
    var menu: String
    var deliveryFee: String
    var time: String // 배달 시간
    
    
}


var FeedList: [Feed] = [Feed(nickname: "전서현", date: "2024-05-23", postId: 12, title: "치킨 먹을 사람", content: "화양동 지점입니다.", menu: "치킨", deliveryFee: "1000", time: "1시간"), Feed(nickname: "전서현", date: "2024-05-23", postId: 12, title: "치킨 먹을 사람", content: "화양동 지점입니다.", menu: "치킨", deliveryFee: "1000", time: "1시간")]

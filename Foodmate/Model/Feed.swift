//
//  Feed.swift
//  Foodmate
//
//  Created by 박근경 on 2024/02/20.
//

import Foundation
import SwiftUI
// 게시된 피드 정보 받아와서 구조체 만들기 : 임시 구조체
struct Feed: Hashable {
    var nickname: String
    var date: String
    
    var title: String
    var content: String
    
    var menu: String
    var deliveryFee: String
    var time: String
}

var FeedList: [Feed] = [
    Feed(nickname: "Neaimt", date: "02/20 13:10", title: "뿌링클 치킨 같이 먹을 사람 구합니다 !", content: "화양지점이고, 순살로 시킬 예정\n배달비 5000원 반반 내실 분 ~", menu: "치킨", deliveryFee: "5000원", time: "저녁 7시"),
    Feed(nickname: "Neai", date: "02/20 13:10", title: "뿌링클 치킨 같이 먹을 사람 구합니다 !", content: "화양지점이고, 순살로 시킬 예정\n배달비 5000원 반반 내실 분 ~", menu: "치킨", deliveryFee: "5000원", time: "저녁 7시")]

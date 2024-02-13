//
//  RegularBtn.swift
//  Foodmate
//
//  Created by 박근경 on 2024/01/09.
//
// 로그인, 회원가입, 다음 버튼에 쓰임

import SwiftUI
func RegularBtn<V> (@State destinationView: @escaping (() -> V), title: String, colorname: String)-> some View where V : View {
    NavigationLink(
        destination: destinationView,
        label: {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(colorname))
                    .shadow(color: Color(hue: 0.035, saturation: 0.0, brightness: 0.0, opacity: 0.4), radius: 2, x: 0, y:2)
                    .frame(width: 300, height: 60)
                Text(title)
                    .font(.Pretendard(.semibold, size:20))
                    .foregroundStyle(Color(.white))
            }
        })
    .navigationBarBackButtonHidden(true)
    
}

func FreeBtn<V> (@State destinationView: @escaping (() -> V), title: String, colorname: String, width: CGFloat, height: CGFloat, fontsize: CGFloat, fontcolor: Color )-> some View where V : View {
    NavigationLink(
        destination: destinationView,
        label: {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(colorname))
                    .shadow(color: Color(hue: 0.035, saturation: 0.0, brightness: 0.0, opacity: 0.4), radius: 2, x: 0, y:2)
                    .frame(width: width, height: height)
                Text(title)
                    .font(.Pretendard(.medium, size: fontsize))
                    .foregroundStyle(Color(fontcolor))
            }
        })
    .navigationBarBackButtonHidden(true)
}


//
//  PageBtn.swift
//  Foodmate
//
//  Created by 박근경 on 2024/04/01.
//

import SwiftUI

struct PageInfo {
    let pageName: String
    let imgName: String
    let width: CGFloat
}
var page: [PageInfo] = [PageInfo(pageName: "작성한\n게시글 보기",imgName: "filemenu.and.selection", width: 45), PageInfo(pageName: "저장한\n레시피 보기", imgName: "menucard", width: 30), PageInfo(pageName: "냉장고\n재료 채우기", imgName: "apple.logo", width: 30)]

struct PageBtn: View {
    var pageNo: PageInfo
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.customred, lineWidth: 2)
                    
                
                VStack {
                    Image(systemName: pageNo.imgName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: pageNo.width)
                        .foregroundStyle(Color.customgray)
                    
                    Text(pageNo.pageName)
                        .font(.Pretendard(.bold, size: 12))
                        .foregroundStyle(Color.black)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .padding(.top, 1)
                    
                }
            }
            .frame(width: 100, height: 100)
    }
}

#Preview {
    PageBtn(pageNo: page[0])
}

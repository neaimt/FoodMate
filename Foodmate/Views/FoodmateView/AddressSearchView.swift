//
//  Address.swift
//  Foodmate
//
//  Created by 박근경 on 2024/02/19.
//

import SwiftUI

struct AddressSearchView: View {
    @State var InputAddress: String = ""
    @Binding var Address: String
    
    var body: some View {
        VStack {
            Header(title: "주소 검색")
            
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .fill(.white)
                    .stroke(Color.custompink, lineWidth: 2)
                    .frame(height: 40)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15)
                        .foregroundColor(.customgray)
                    
                    TextField("지번, 도로명, 건물명으로 검색", text: $InputAddress)
                        .onSubmit {
                            if InputAddress != "" {
                                Address = InputAddress
                            }
                            InputAddress = ""
                        }
                        .disableAutocorrection(true)
                }
                .padding(.leading, 15)
                
            }
            .padding(.horizontal, 30)
            
            HStack {
                Spacer()
                    .frame(width: 40)
                
                VStack(alignment: .leading) {
                    Text("▪︎ 도로명 + 건물번호")
                        .font(.Pretendard(.regular, size: 18))
                    Text("예)")
                        .font(.Pretendard(.regular, size: 15))
                        .padding(.bottom, 1)
                    Text("▪︎ 지역명 + 번지")
                        .font(.Pretendard(.regular, size: 18))
                    Text("예)")
                        .font(.Pretendard(.regular, size: 15))
                        .padding(.bottom, 1)
                    Text("▪︎ 건물명 또는 아파트명")
                        .font(.Pretendard(.regular, size: 18))
                    Text("예)")
                        .font(.Pretendard(.regular, size: 15))
                        .padding(.bottom, 1)
                }
                .foregroundStyle(Color.customgray)
                
                Spacer()
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .background(Color.customwhitegray)
    }
}

//
//  MainView.swift
//  Foodmate
//
//  Created by 박근경 on 2024/02/08.
//

import SwiftUI
struct MainView: View {
    @State var selected: Bool = false
    @State private var isShowingSheet = false
    @State var RowString: Set<String> = []
    
    var body: some View {
        VStack {
            MainHeader()
            
            Image("Logo_fork")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding(.bottom, 30)
                .padding(.top, 40)
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white.shadow(.drop(color: Color(hue: 0.035, saturation: 0.0, brightness: 0.0, opacity: 1), radius: 1, x:0, y:0)))
                    .frame(width: 250, height: 250)
                
                LazyVGrid(columns: [GridItem(.fixed(90), spacing: 10),
                                    GridItem(.fixed(90), spacing: 10)], content: {
                    ForEach(RowString.sorted(), id: \.self) { index in
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.white)
                                .stroke(.customgray, lineWidth: 1)
                                .frame(width: 90, height: 30)
                            
                            Text(index)
                                .foregroundStyle(.black)
                                .font(.Pretendard(.regular, size:12))
                        }
                    }
                })
            }
            
            HStack {
                Spacer()
                Button(action: {
                    isShowingSheet.toggle()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .shadow(color: Color(hue: 0.035, saturation: 0.0, brightness: 0.0, opacity: 0.4), radius: 2, x: 0, y:2)
                            .frame(width: 115, height: 60)
                        
                        Text("재료선택")
                            .font(.Pretendard(.regular, size:14))
                            .foregroundStyle(.customgray)
                    }
                })
                .sheet(isPresented: $isShowingSheet,
                       onDismiss: didDismiss) {
                    
                    ListView(isShowingSheet: $isShowingSheet, RowString: $RowString)
                        .presentationDetents([.large,.fraction(0.65)])
                        .presentationDragIndicator(.hidden)
                        .padding(.vertical, 50)
                }
                
                Spacer()
                    .frame(width: 25)
                
                Button(action: {
                    
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.custompink)
                            .shadow(color: Color(hue: 0.035, saturation: 0.0, brightness: 0.0, opacity: 0.4), radius: 2, x: 0, y:2)
                            .frame(width: 115, height: 60)
                        
                        Text("재료조합")
                            .font(.Pretendard(.regular, size:14))
                            .foregroundStyle(.white)
                    }
                })
                Spacer()
            }
            .padding(.top, 20)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func didDismiss() {
            // Handle the dismissing action.
        }
}

// MARK: sheet 페이지 - 재료 선택하는 뷰
struct ListView: View {
    @Binding var isShowingSheet: Bool
    @Binding var RowString: Set<String>
    @State var isMaximum: Bool = false
    
    var body: some View {
        VStack {
            // 박스 안에 선택된 재료들이 보임
            ScrollView {
                LazyVGrid(columns: [GridItem(.fixed(150), alignment: .center), GridItem(.fixed(150), alignment: .center)], content: {
                    ForEach(listrow) { ingredient in
                        Button(action: {
                            if ingredient.isChecked {
                                ingredient.isChecked.toggle()
                                RowString.remove(ingredient.name)
                            }
                            
                            else if RowString.count < 10 {
                                ingredient.isChecked.toggle()
                                if ingredient.isChecked {
                                    RowString.insert(ingredient.name)
                                }
                            }
                            else {
                                isMaximum = true
                            }
                            
                        }, label: {
                            // 재료 버튼 모양
                            VStack {
                                Divider()
                                    .background(Color.customgray)
                                    .frame(width: 130)
                                
                                ZStack {
                                    ingredient.isChecked ?
                                    Rectangle()
                                        .fill(.gray.opacity(0.1)) :
                                    Rectangle()
                                        .fill(.white.opacity(0.1))
                                    
                                    Text(ingredient.name)
                                        .font(.Pretendard(.bold, size:16))
                                        .foregroundColor(Color.black)
                                }
                                .frame(width: 130, height: 30)
                            }
                        })
                        .alert("최대 10개까지 선택 가능합니다.", isPresented: $isMaximum) {
                            Button("확인", role: .cancel) {
                                isMaximum = false
                            }
                        }
                    }
                })
            }
            .scrollIndicators(.automatic)
            
            Text("\(RowString.count.description)개 선택")
                .font(.Pretendard(.bold, size: 20))
                .padding(20)
                .frame(height: 100)
            
            Button(action: { isShowingSheet.toggle() }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.custompink)
                        .shadow(color: Color(hue: 0.035, saturation: 0.0, brightness: 0.0, opacity: 0.4), radius: 2, x: 0, y:2)
                        .frame(width: 120, height: 40)
                    
                    Text("완료")
                        .font(.Pretendard(.regular, size:14))
                        .foregroundStyle(.white)
                }
            }
            
        }
    }
}

#Preview {
    MainView()
}

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
    
    let columns = [
        GridItem(.fixed(90), spacing: 10),
        GridItem(.fixed(90), spacing: 10)
    ]
    
    var body: some View {
        VStack {
            MainHeader()
            
            Image("Logo_fork")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding(.bottom, 30)
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white.shadow(.drop(color: Color(hue: 0.035, saturation: 0.0, brightness: 0.0, opacity: 1), radius: 1, x:0, y:0)))
                    .frame(width: 250, height: 250)
                
                LazyVGrid(columns: columns, content: {
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
    }
    
    func didDismiss() {
            // Handle the dismissing action.
        }
}


//MARK : 재료 선택 뷰 ( 재료 모델 따로 만들기! )
class ingredient: Identifiable {
    let name: String
    var id = UUID()
    var isChecked: Bool
    
    init(name: String, id: UUID = UUID(), isChecked: Bool) {
        self.name = name
        self.id = id
        self.isChecked = isChecked
    }
}

private var listrow = [
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
    ingredient(name: "삼치", isChecked: false)
]

struct ListView: View {
    @Binding var isShowingSheet: Bool
    @Binding var RowString: Set<String>
    @State var isMaximum: Bool = false
    
    var body: some View {
        VStack {
            List(listrow) { ingredient in
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
                    HStack {
                        ingredient.isChecked ?
                        Image(systemName: "checkmark.circle").foregroundColor(Color.custompink)
                        : Image(systemName: "circle").foregroundColor(Color.custompink)
                        
                        Text(ingredient.name)
                            .foregroundColor(Color.black)
                    }
                })
                .alert("최대 10개까지 선택 가능합니다.", isPresented: $isMaximum) {
                    Button("확인", role: .cancel) {
                        isMaximum = false
                    }
                }
            }
            .scrollContentBackground(.hidden)
            
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

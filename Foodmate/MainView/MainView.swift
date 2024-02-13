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
    
    var body: some View {
        VStack {
            MainHeader()
            
//            Image("Logo_fork")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 150, height: 150)
//                .padding(.bottom, 30)
//            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white.shadow(.drop(color: Color(hue: 0.035, saturation: 0.0, brightness: 0.0, opacity: 1), radius: 1, x:0, y:0)))
                    .frame(width: 250, height: 250)
                
                LazyHGrid(rows: [GridItem(.fixed(20))], content: {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.white)
                                .stroke(.customgray, lineWidth: 1)
                                .frame(width: 90, height: 30)
                                
                            Text("Button")
                                .foregroundStyle(.black)
                                .font(.Pretendard(.regular, size:12))
                        }
                    })
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
//                            VStack {
//                                Text("License Agreement")
//                                    .font(.title)
//                                    .padding(50)
//                                Text("""
//                                        Terms and conditions go here.
//                                    """)
//                                    .padding(50)
//                                Button(action: { isShowingSheet.toggle() }) {
//                                    ZStack {
//                                        RoundedRectangle(cornerRadius: 20)
//                                            .fill(.custompink)
//                                            .shadow(color: Color(hue: 0.035, saturation: 0.0, brightness: 0.0, opacity: 0.4), radius: 2, x: 0, y:2)
//                                            .frame(width: 120, height: 40)
//                                        
//                                        Text("완료")
//                                            .font(.Pretendard(.regular, size:14))
//                                            .foregroundStyle(.white)
//                                    }
//                                }
//                            }
                        }
                
                Spacer()
                    .frame(width: 25)
                
                Button(action: {
                    isShowingSheet.toggle()
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
//MARK : 재료 선택 뷰
struct ingredient: Identifiable, Hashable {
    let name: String
    let id = UUID()
}

private var oceans = [
    ingredient(name: "Pacific"),
    ingredient(name: "Atlantic"),
    ingredient(name: "Indian"),
    ingredient(name: "Southern"),
    ingredient(name: "Arctic")
]

struct ListView: View {
    private var oceans = [
        ingredient(name: "Pacific"),
        ingredient(name: "Atlantic"),
        ingredient(name: "Indian"),
        ingredient(name: "Southern"),
        ingredient(name: "Arctic")
    ]
    
    @Binding var isShowing: Bool
    @State private var multiSelection = Set<UUID>()
    
    var body: some View {
        VStack {
            NavigationView {
                    List(oceans, selection: $multiSelection) {
                        Text($0.name)
                    }
                    .navigationTitle("Oceans")
                    .toolbar { EditButton() }
                }
                Text("\(multiSelection.count) selections")

            Button(action: { isShowing.toggle() }) {
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

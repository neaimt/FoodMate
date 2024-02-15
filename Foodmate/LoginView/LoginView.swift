//
//  LoginView.swift
//  Foodmate
//
//  Created by 박근경 on 2024/01/09.
//

import SwiftUI
struct LoginView: View {
    var body: some View {
        NavigationStack {
            Spacer()
                .frame(height: 100)
            Image("Logo_fire")
                .resizable()
                .scaledToFit()
                .frame(width: 250)
                .padding(.bottom, 40)
                    
            RegularBtn(destinationView: {LoginView1()}, title: "로그인", colorname: "custompink")
            Spacer()
                .frame(height: 19)
            RegularBtn(destinationView: {SignupView()}, title: "회원가입", colorname: "customred")
            Spacer()
        }
    }
}

struct LoginView1: View {
    let screenHeight = UIScreen.main.bounds.size.height
    
    @State var IdInput: String = ""
    @State var PasswordInput: String = ""
    
    var body: some View {
        VStack {
            Header(title: "로그인") 
            Spacer()
            Image("Logo_fire")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 218.44)
                .padding(.bottom, 20)
            
            TextField("아이디", text: $IdInput)
                .keyboardType(.default)
                .loginTextFieldModifier(width: 300, height: 40, size: 14)
                .padding(.bottom, 10)
            
            SecureField("패스워드", text: $PasswordInput)
                .keyboardType(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
                .loginTextFieldModifier(width: 300, height: 40, size: 14)
                .padding(.bottom, 40)
            
            RegularBtn(destinationView: {
                MainView()}, title: "로그인", colorname: "custompink")
            Spacer()
                .frame(height: screenHeight/3)
            
        }
    }
}

//MARK: 로그인 화면
#Preview {
    LoginView()
}

//
//  SignupView.swift
//  Foodmate
//
//  Created by 박근경 on 2024/01/10.
//

import SwiftUI

struct SignupView: View {
    @State var IdInput: String = ""
    @State var PasswordInput: String = ""
    @State var PasswordCheckInput: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Header(title: "회원가입")
                
                ProgressView(value: 0.5)
                    .progressViewStyle(PinkProgressView(value: "50%"))
                    .padding(.bottom, 30)
                
                ZStack(alignment: .trailing) {
                    TextField("아이디", text: $IdInput)
                        .keyboardType(.default)
                        .loginTextFieldModifier(width: 300, height: 40, size: 14)
                        
                    Button(action: {
                        // 중복 확인하는 액션 넣어줘야 함
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.custommiddlegray)
                                .frame(width: 60, height: 30)
                                
                            Text("중복 확인")
                                .font(.Pretendard(.bold, size: 10))
                                .foregroundStyle(Color.white)
                        }
                    })
                    .padding(.trailing, 5)
                }
                .padding(.bottom, 10)
                
                SecureField("패스워드", text: $PasswordInput)
                    .keyboardType(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
                    .loginTextFieldModifier(width: 300, height: 40, size: 14)
                    .padding(.bottom, 10)
                
                SecureField("패스워드 확인", text: $PasswordInput)
                    .keyboardType(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
                    .loginTextFieldModifier(width: 300, height: 40, size: 14)
                    .padding(.bottom, 30)
                
                HStack {
                    Spacer()
                    FreeBtn(destinationView: {SignupView1()}, title: "다음", colorname: "custompink", width: 100, height: 45, fontsize: 15, fontcolor: .white)
                    Spacer()
                        .frame(width: 46)
                }
                
                Spacer()
            }
        }
    }
}

struct SignupView1: View {
    @State var NameInput: String = ""
    @State var NicknameInput: String = ""
    @State var EmailInput: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Header(title: "회원가입")
            
                ProgressView(value: 1)
                    .progressViewStyle(PinkProgressView(value: "100%"))
                    .padding(.bottom, 30)
                
                
                TextField("이름", text: $NameInput)
                    .keyboardType(.default)
                    .loginTextFieldModifier(width: 300, height: 40, size: 14)
                    .padding(.bottom, 10)
                
                TextField("닉네임", text: $NicknameInput)
                    .keyboardType(.default)
                    .loginTextFieldModifier(width: 300, height: 40, size: 14)
                    .padding(.bottom, 10)

                TextField("이메일", text: $EmailInput)
                    .keyboardType(.emailAddress)
                    .loginTextFieldModifier(width: 300, height: 40, size: 14)
                    .padding(.bottom, 10)
                
                HStack { // 임시 DataPicker 만들어서 제작할 예정
                    TextField("태어난 년도", text: $EmailInput)
                        .keyboardType(.decimalPad)
                        .loginTextFieldModifier(width: 130, height: 40, size: 14)
                    Spacer()
                    TextField("월", text: $EmailInput)
                        .keyboardType(.decimalPad)
                        .loginTextFieldModifier(width: 70, height: 40, size: 14)
                    Spacer()
                    TextField("일", text: $EmailInput)
                        .keyboardType(.decimalPad)
                        .loginTextFieldModifier(width: 70, height: 40, size: 14)
                }
                .frame(width: 300)
                .padding(.bottom, 30)
                
                VStack {
                    Text("개인정보 수집 및 이용 동의 안내")
                        .foregroundStyle(Color("customgray"))
                        .font(.Pretendard(.regular, size:8))
                        .frame(width:300, alignment: .leading)
                        .padding(.leading, 10)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                        .shadow(color: Color(hue: 0.035, saturation: 0.0, brightness: 0.0, opacity: 0.1), radius: 2)
                        .frame(width: 300, height: 34)
                    
                    Text("위의 내용에 동의합니다")
                        .foregroundStyle(Color("customgray"))
                        .font(.Pretendard(.regular, size:8))
                        .frame(width:300, alignment: .trailing)
                        .padding(.trailing, 10)
                }
                .padding(.bottom, 30)
                RegularBtn(destinationView: {OnboardingView()}, title: "회원가입", colorname: "customred")
                Spacer()
            }
        }
    }
}

#Preview {
    SignupView()
}

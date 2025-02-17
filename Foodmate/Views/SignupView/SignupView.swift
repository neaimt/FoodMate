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
    
    @State var isCheckId: Bool = false
    @State var isCheckPw: Bool = false
    @State var progressValue: Float = 0
    
    @State var noCheckStr: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Header(title: "회원가입")
                
                ProgressView(value: progressValue, total: 100)
                    .progressViewStyle(PinkProgressView(value: "\(Int(progressValue))%"))
                    .padding(.bottom, 30)
                
                ZStack(alignment: .trailing) {
                    TextField("아이디", text: $IdInput)
                        .keyboardType(.default)
                        .loginTextFieldModifier(width: 300, height: 40, size: 14)
                    
                    Button(action: {
                        // 중복 확인하는 액션 넣어줘야 함
                        // if ( 아디 중복 안됨 )
                        isCheckId = true
                        progressValue = 25
                        // else 중복 경고 문구
                        PasswordInput = ""
                        PasswordCheckInput = ""
                        isCheckPw = false
                        
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
                    .keyboardType(.default)
                    .loginTextFieldModifier(width: 300, height: 40, size: 14)
                    .padding(.bottom, 10)
                
                 
                SecureField("패스워드 확인", text: $PasswordCheckInput)
                    .keyboardType(.default)
                    .loginTextFieldModifier(width: 300, height: 40, size: 14)
                   
                    .onChange(of: PasswordCheckInput) { oldValue, newValue in
                        if ( isCheckId ) {
                            if ( newValue != "" && newValue == PasswordInput ) {
                                progressValue = 50
                                noCheckStr = ""
                                isCheckPw = true
                            }
                            else{
                                progressValue = 25
                                noCheckStr = "패스워드가 일치하지 않습니다."
                                isCheckPw = false
                            }
                        }
                    }
                HStack {
                    Text(noCheckStr)
                        .font(.Pretendard(.regular, size: 12))
                        .padding(.leading, 60)
                        .padding(.top, 2)
                       
                    Spacer()
                }

                    
                
                HStack {
                    Spacer()
                    if ( isCheckId && isCheckPw ) {
                        FreeBtn(destinationView: {SignupView1(progressValue: $progressValue)}, title: "다음", colorname: "custompink", width: 100, height: 45, fontsize: 15, fontcolor: .white)
                        Spacer()
                            .frame(width: 46)
                    }
                }
                
                Spacer()
            }
        }.navigationBarBackButtonHidden()
    }
}

struct SignupView1: View {
    @State var NameInput: String = ""
    @State var NicknameInput: String = ""
    @State var EmailInput: String = ""
    @Binding var progressValue: Float
    
    var body: some View {
        NavigationStack {
            VStack {
                Header(title: "회원가입")
            
                ProgressView(value: progressValue, total: 100)
                    .progressViewStyle(PinkProgressView(value: "\(Int(progressValue))%"))
                    .padding(.bottom, 30)
                
                
                TextField("이름", text: $NameInput)
                    .keyboardType(.default)
                    .loginTextFieldModifier(width: 300, height: 40, size: 14)
                    .padding(.bottom, 10)
                    .onChange(of: NameInput) {
                        progressValue = 60
                    }
                
                TextField("닉네임", text: $NicknameInput)
                    .keyboardType(.default)
                    .loginTextFieldModifier(width: 300, height: 40, size: 14)
                    .padding(.bottom, 10)
                    .onChange(of: NicknameInput) {
                        if ( progressValue == 60 ) {
                            progressValue = 70
                        }
                    }

                TextField("이메일", text: $EmailInput)
                    .keyboardType(.emailAddress)
                    .loginTextFieldModifier(width: 300, height: 40, size: 14)
                    .padding(.bottom, 10)
                    .onChange(of: EmailInput) {
                        if ( progressValue == 70 ) {
                            progressValue = 80
                        }
                    }
                
//                HStack { // 임시 DataPicker 만들어서 제작할 예정
//                    TextField("태어난 년도", text: $EmailInput)
//                        .keyboardType(.decimalPad)
//                        .loginTextFieldModifier(width: 130, height: 40, size: 14)
//                    Spacer()
//                    TextField("월", text: $EmailInput)
//                        .keyboardType(.decimalPad)
//                        .loginTextFieldModifier(width: 70, height: 40, size: 14)
//                    Spacer()
//                    TextField("일", text: $EmailInput)
//                        .keyboardType(.decimalPad)
//                        .loginTextFieldModifier(width: 70, height: 40, size: 14)
//                }
//                .frame(width: 300)
//                .padding(.bottom, 30)
                
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
                    
                    HStack {
                        Text("위의 내용에 동의합니다")
                            .foregroundStyle(Color("customgray"))
                            .font(.Pretendard(.regular, size:8))
                            .frame(width:300, alignment: .trailing)
                            .padding(.trailing, 10)
                        
                    }
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

//
//  LoginTextFieldModifier.swift
//  Foodmate
//
//  Created by 박근경 on 2024/01/10.
//

import SwiftUI

struct LoginTextFieldModifier: ViewModifier {
    var width: CGFloat
    var height: CGFloat
    var size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.Pretendard(.medium, size: size))
            .padding(.leading, 20)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled(true)
            .frame(width: width, height: height)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white.shadow(.drop(color: Color(hue: 0.035, saturation: 0.0, brightness: 0.0, opacity: 0.1),radius: 2, x: 0, y: 1)))
                    .shadow(color: Color(hue: 0.035, saturation: 0.0, brightness: 0.0, opacity: 0.2), radius: 2, x: 0, y:2)
                    .frame(width: width, height: height)
            }
    }
}

extension View {
    func loginTextFieldModifier(width: CGFloat, height: CGFloat, size: CGFloat) -> some View {
        modifier(LoginTextFieldModifier(width: width, height: height, size: size))
    }
}

extension UINavigationController: ObservableObject, UIGestureRecognizerDelegate {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}

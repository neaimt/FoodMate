//
//  box.swift
//  Foodmate
//
//  Created by 박근경 on 2024/01/10.
//

import SwiftUI

struct box: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.white.shadow(.drop(color: Color(hue: 0.035, saturation: 0.0, brightness: 0.0, opacity: 0.1),radius: 5, x: 0, y: 2)))
            .shadow(color: Color(hue: 0.035, saturation: 0.0, brightness: 0.0, opacity: 0.2), radius: 2, x: 0, y:2)
            .frame(width: 300, height: 40)
    }
}

#Preview {
    box()
}

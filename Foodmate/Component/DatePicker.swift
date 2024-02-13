//
//  DatePicker.swift
//  Foodmate
//
//  Created by 박근경 on 2024/01/10.
//

import SwiftUI
struct DatePicker: View {
    @State var date = Date()
    
    var body: some View {
        DatePicker(selection: $date, displayedComponents: [.date], label: Text("Date"))
    }
}

#Preview {
    DatePicker()
}

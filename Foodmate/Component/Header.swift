import SwiftUI

struct Header : View {
    @Environment(\.presentationMode) var presentationMode
    let title: String
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white.shadow(.drop(color: Color(hue: 0.035, saturation: 0.0, brightness: 0.0, opacity: 0.05), radius: 3, x:0, y:2)))
                .shadow(color:Color(hue: 0.035, saturation: 0.0, brightness: 0.0, opacity: 0.3), radius: 1, y:1)
                .frame( height: 99)
                
                
            
            HStack(alignment: .center) {
                Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                    Image("arrow")
                        .resizable()
                        .offset(y:25)
                        .frame(width: 45, height: 45)
                })
                Spacer()
            }
            Text(title)
                .font(.Pretendard(.semibold, size: 20))
                .offset(y:22)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    Header(title: "text")
}

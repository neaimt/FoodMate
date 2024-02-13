import SwiftUI
struct MainHeader : View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white.shadow(.drop(color: Color(hue: 0.035, saturation: 0.0, brightness: 0.0, opacity: 0.05), radius: 1, x:0, y:2)))
                .frame( height: 110)
            
            HStack {
                Image("Logo_black")
                    .resizable()
                    .scaledToFit()
                    .frame(width:45, height: 45)
                    .padding(.leading, 20)
                
                Spacer()
                
                
                Text("Food Mate")
                    .font(.Pretendard(.semibold, size: 30))
                    .padding(.leading, 10)
                    
                    
                Spacer()
                
                Button(action: {
                    print("알림화면")
                }, label: {
                    Image(systemName: "bell.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .padding(.trailing, 10)
                        .foregroundColor(.custommiddlegray)
                })
                
                Button(action: {
                    print("재료추가화면")
                }, label: {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .padding(.trailing, 20)
                        .foregroundColor(.custommiddlegray)
                })
            }
            .offset(y: 22)
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MainHeader()
}

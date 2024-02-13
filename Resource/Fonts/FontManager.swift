import SwiftUI
extension Font {
    enum pretendard {
        case semibold
        case medium
        case black
        case regular
        case bold
        
        var value: String {
            switch self {
            case .semibold:
                return "Pretendard-SemiBold"
            case .medium:
                return "Pretendard-Medium"
            case .black:
                return "Pretendard-Black"
            case .regular:
                return "Pretendard-Regular"
            case .bold:
                return "Pretendard-Blod"
            }
        }
    }

    static func Pretendard(_ type: pretendard, size: CGFloat = 17) -> Font {
        return .custom(type.value, size: size)
    }
    //사용하려면 -> .font(.Pretendard(.regular, size:10)
}

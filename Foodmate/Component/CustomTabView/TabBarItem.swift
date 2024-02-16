
import SwiftUI

// MARK: 탭바 아이템 enum
enum TabBarItem: Hashable {
    case search, mate, home, message, profile
    
    var iconName: String {
        switch self {
        case .search:
            return "magnifyingglass"
        case .mate:
            return "person.3.fill"
        case .home:
            return "house.fill"
        case .message:
            return "quote.bubble.fill"
        case .profile:
            return "person.fill"
        }
    }
    
    var title: String {
        switch self {
        case .search:
            return "레시피 검색"
        case .mate:
            return "푸드 메이트"
        case .home:
            return "홈"
        case .message:
            return "채팅"
        case .profile:
            return "마이페이지"
        }
    }
}

import Foundation

extension Constant {
    public enum Tab: Int, CaseIterable {
        case home = 0
        case all
        case write
        case alarm
        case profile
        
        var title: String {
            switch self {
            case .home: return "홈"
            case .all: return "전체보기"
            case .write: return "게시"
            case .alarm: return "알림"
            case .profile: return "프로필"
            }
        }
        
        var iconName: String {
            switch self {
            case .home: return ""
            case .all: return ""
            case .write: return ""
            case .alarm: return ""
            case .profile: return ""
            }
        }
    }
}

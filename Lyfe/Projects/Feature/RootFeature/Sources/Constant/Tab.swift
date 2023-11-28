import Foundation
import SwiftUI
import DesignSystem

extension Constant {
    public enum Tab: Int, Hashable, Equatable, CaseIterable {
        case home = 0
        case feed
        case write
        case alarm
        case profile
        
        var title: String {
            switch self {
            case .home: return "홈"
            case .feed: return "피드"
            case .write: return "게시"
            case .alarm: return "알림"
            case .profile: return "프로필"
            }
        }
        
        var icon: Image {
            switch self {
            case .home: return R.Common.iconHome
            case .feed: return R.Common.iconFeed
            case .write: return R.Common.iconWrite
            case .alarm: return R.Common.iconAlarm
            case .profile: return R.Common.iconProfile
            }
        }
        
        var activeIcon: Image {
            switch self {
            case .home: return R.Common.iconHomeActive
            case .feed: return R.Common.iconFeedActive
            case .write: return R.Common.iconWriteActive
            case .alarm: return R.Common.iconAlarmActive
            case .profile: return R.Common.iconProfileActive
            }
        }
    }
}

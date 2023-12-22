import Foundation

public enum NotificationsDTO {}

extension NotificationsDTO {
    // MARK: - Response
    public struct Response: Decodable {
        public let result: [Result]
        public var page: Page
    }
    
    public struct Result: Decodable {
        public var notificationList: [Notification]
    }
    
    public struct Notification: Decodable {
        public var notificationType: NotificationType
        public var content, notifiedAt: String
    }
}

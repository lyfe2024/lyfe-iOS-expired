
import Foundation

extension UsersDTO {
    public enum Me {}
}

// MARK: - Response
extension UsersDTO.Me {
    public struct Response: Decodable {
        public let result: [Result]
    }

    public struct Result: Decodable {
        public let id: Int
        public var username: String
        public var profile: String
    }
}

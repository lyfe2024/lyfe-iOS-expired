
import Foundation

extension UsersDTO {
    public enum CheckNickname {}
}

// MARK: - Response
extension UsersDTO.CheckNickname {
    public struct Response: Decodable {
        public let result: [Result]
    }

    public struct Result: Decodable {
        public let isAvailable: Bool
    }
}

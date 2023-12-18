import Foundation
import BaseDomainInterface

extension BoardsDTO {
    public enum List {}
}

// MARK: - Response
extension BoardsDTO.List {
    public struct Response: Decodable {
        public let result: [Result]
    }

    public struct Result: Decodable {
        public let id: Int
        public var user: User
        public var title: String
        public var content: String
        public var boardType, whiskyCount, commentCount, updatedAt: String
    }
}

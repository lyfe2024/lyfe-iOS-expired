
import Foundation
import BaseDomainInterface

extension CommentsDTO {
    public enum List {}
}

// MARK: - Response
extension CommentsDTO.List {
    public struct Response: Decodable {
        public let result: [Result]
        public var page: Page
    }

    public struct Result: Decodable {
        public let id: Int
        public var commentList: [Comment]
    }
}


import Foundation

extension CommentsDTO {
    public enum Create {}
}


extension CommentsDTO.Create {
    // MARK: - Request
    public struct Request: Decodable {
        public var boardID: Int
        public var content: String
    }
    
    // MARK: - Response
    public struct Response: Decodable {
        public let result: [Result]
    }

    public struct Result: Decodable {
        public let id: Int
    }
}

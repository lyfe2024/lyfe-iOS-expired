
import Foundation

extension CommentsDTO {
    public enum Update {}
}


extension CommentsDTO.Update {
    // MARK: - Request
    public struct Request: Decodable {
        public let commentID: Int
        public var content: String
    }
    
    // MARK: - Response
//    public struct Response: Decodable {
//        public let result: [Result]
//    }
//
//    public struct Result: Decodable {
//        public let id: Int
//    }
}

import Foundation
import BaseDomainInterface

extension BoardsDTO {
    public enum Write {}
}


// MARK: - Request
extension BoardsDTO.Write {
    public struct Request: Encodable {
        public var title: String
        public var content: String
        public var boardType: BoardType
        public var userID: Int
        public var topicID: Int
        
        public init(
            title: String,
            content: String,
            boardType: BoardType,
            userID: Int,
            topicID: Int
        ) {
            self.title = title
            self.content = content
            self.boardType = boardType
            self.userID = userID
            self.topicID = topicID
        }
    }
}

// MARK: - Response
//extension BoardsDTO.Write {
//    public struct Response: Decodable {
//        public let result: Result
//    }
//
//    public struct Result: Decodable {
//        public let id: Int
//    }
//}

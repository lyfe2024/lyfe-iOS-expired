
import Foundation

extension CommentsDTO {
    public enum Update {}
}

// MARK: - Response
extension CommentsDTO.Update {
    public struct Response: Decodable {
        public let result: [Result]
    }

    public struct Result: Decodable {
        public let id: Int
    }
}

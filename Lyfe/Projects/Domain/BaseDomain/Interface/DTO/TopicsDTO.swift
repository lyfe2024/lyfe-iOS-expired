import Foundation

public enum TopicsDTO {}

extension TopicsDTO {
    // MARK: - Response
    public struct Response: Decodable {
        public let result: [Result]
    }
    
    public struct Result: Decodable {
        public var topic, date: String
    }
}

import Foundation

public enum PolicysDTO {}

extension PolicysDTO {
    // MARK: - Response
    public struct Response: Decodable {
        public let result: [Result]
    }
    
    public struct Result: Decodable {
        public var title, content, version: String
        public var policyType: String
    }
}

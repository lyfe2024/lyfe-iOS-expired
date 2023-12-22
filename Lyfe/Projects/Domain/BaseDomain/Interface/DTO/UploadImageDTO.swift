
import Foundation

extension CommonDTO {
    public enum UploadImage {}
}


extension CommonDTO.UploadImage {
    // MARK: - Request
    public struct Request: Encodable {
        public var format: String
        public var path: String
        public var image: Data
        
        public init(format: String, path: String, image: Data) {
            self.format = format
            self.path = path
            self.image = image
        }
    }

    // MARK: - Response
    public struct Response: Decodable {
        public let result: [Result]
    }
    
    public struct Result: Decodable {
        public var url: String
        public var key, expiresAt: String
    }
}

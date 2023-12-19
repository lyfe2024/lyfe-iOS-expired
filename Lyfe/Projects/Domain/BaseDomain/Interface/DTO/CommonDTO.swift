
import Foundation

public struct CommonDTO {}


extension CommonDTO {
    // MARK: - Request
//    public struct Request: Decodable {
//        
//    }

    // MARK: - Response
    public struct Response: Decodable {
        public let result: [Result]
    }
    
    public struct Result: Decodable {
        public let id: Int
    }
}

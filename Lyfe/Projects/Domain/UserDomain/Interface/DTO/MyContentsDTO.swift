import BaseDomainInterface
import Foundation

extension UsersDTO {
    public enum MyContents {}
}

// MARK: - Response
extension UsersDTO.MyContents {
    public struct Response: Decodable {
        public let result: Result
        public let page: Page
    }

    public struct Result: Decodable {
        public let boardPictureList: [BoardContent]
    }
}

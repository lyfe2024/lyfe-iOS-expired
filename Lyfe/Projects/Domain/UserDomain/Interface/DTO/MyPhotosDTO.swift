import BaseDomainInterface
import Foundation

extension UsersDTO {
    public enum MyPhotos {}
}

// MARK: - Response
extension UsersDTO.MyPhotos {
    public struct Response: Decodable {
        public let result: Result
        public let page: Page
    }

    public struct Result: Decodable {
        public let boardPictureList: [BoardPicture]
    }
}

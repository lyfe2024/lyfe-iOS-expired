import BaseDomainInterface
import Foundation

extension BoardsDTO {
    public enum Picture {}
}

extension BoardsDTO.Picture {
    public struct LatestResponse: Decodable {
        public var result: [BoardPicture]
        public var page: Page
    }
}

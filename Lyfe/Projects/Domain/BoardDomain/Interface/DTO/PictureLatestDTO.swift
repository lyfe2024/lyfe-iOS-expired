import BaseDomainInterface
import Foundation

extension BoardsDTO {
    public enum Picture {}
}

extension BoardsDTO.Picture {
    public struct LatestResponse: Decodable {
        public var result: [BoardPictureList]
        public var page: Page
    }
}

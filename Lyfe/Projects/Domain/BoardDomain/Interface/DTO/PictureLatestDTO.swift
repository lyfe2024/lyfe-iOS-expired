import BaseDomainInterface
import Foundation

extension BoardsDTO {
    public enum Picture {}
}

extension BoardsDTO.Picture {
    public struct LatestResponse: Decodable {
        public let result: [BoardPictureList]
        public let page: Page
    }
}
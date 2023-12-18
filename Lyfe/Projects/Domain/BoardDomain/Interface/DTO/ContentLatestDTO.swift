import BaseDomainInterface
import Foundation

extension BoardsDTO {
    public enum Content {}
}

extension BoardsDTO.Content {
    public struct LatestResponse: Decodable {
        public var result: [BoardContentList]
        public var page: Page
    }
}

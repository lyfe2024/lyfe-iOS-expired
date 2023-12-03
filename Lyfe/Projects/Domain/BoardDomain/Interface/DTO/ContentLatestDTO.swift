import BaseDomainInterface
import Foundation

extension BoardsDTO {
    public enum Content {}
}

extension BoardsDTO.Content {
    public struct LatestResponse: Decodable {
        public let result: [BoardContentList]
        public let page: Page
    }
}

import Foundation
import BaseDomainInterface

extension BoardsDTO.Content {
    public struct HotResponse: Decodable {
        public let result: [BoardContentList]
        public let page: Page
    }
}

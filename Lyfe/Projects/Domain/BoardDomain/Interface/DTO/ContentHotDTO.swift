import Foundation
import BaseDomainInterface

extension BoardsDTO.Content {
    public struct HotResponse: Decodable {
        public var result: [BoardContentList]
        public var page: Page
    }
}

import Foundation
import BaseDomainInterface

extension BoardsDTO.Content {
    public struct HotResponse: Decodable {
        public var result: [BoardContent]
        public var page: Page
    }
}

import BaseDomainInterface
import Foundation

extension BoardsDTO.Picture {
    public struct HotResponse: Decodable {
        public var result: [BoardPicture]
        public var page: Page
    }
}

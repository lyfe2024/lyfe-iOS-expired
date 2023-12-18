import BaseDomainInterface
import Foundation

extension BoardsDTO.Picture {
    public struct HotResponse: Decodable {
        public var result: [BoardPictureList]
        public var page: Page
    }
}

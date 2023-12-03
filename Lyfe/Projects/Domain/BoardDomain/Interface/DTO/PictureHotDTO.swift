import BaseDomainInterface
import Foundation

extension BoardsDTO.Picture {
    public struct HotResponse: Decodable {
        public let result: [BoardPictureList]
        public let page: Page
    }
}

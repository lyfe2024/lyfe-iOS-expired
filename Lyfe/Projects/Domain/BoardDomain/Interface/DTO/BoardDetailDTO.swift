import Foundation

extension BoardsDTO {
    public struct DetailResponse: Decodable {
        public let id: Int
        public var user: User
        public var title, content, boardType: String
        public var whiskyCount, commentCount: Int
        public var isLike: Bool
        public var updatedAt: String
    }
}

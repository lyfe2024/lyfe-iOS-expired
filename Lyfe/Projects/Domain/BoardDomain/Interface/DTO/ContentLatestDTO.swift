import BaseDomainInterface
import Foundation

extension BoardsDTO {
    public enum Content {}
}

extension BoardsDTO.Content {
    public struct LatestResponse: Decodable {
        public let result: BoardContentList
        public let page: Page
    }
}

extension BoardsDTO.Content.LatestResponse {
    
    // MARK: - BoardContentList
    public struct BoardContentList: Decodable {
        public let id: Int
        public let title, content: String
        public let boardType: BoardType
        public let createdAt, updatedAt: String
        public let user: User
        public let whiskyCount, commentCount: Int
        public let isLike: Bool
    }

    // MARK: - User
    public struct User: Decodable {
        public let id: Int
        public let username: String
        public let profile: String
    }
}

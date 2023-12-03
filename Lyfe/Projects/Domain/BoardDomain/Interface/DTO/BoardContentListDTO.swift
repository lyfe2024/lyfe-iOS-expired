import Foundation

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

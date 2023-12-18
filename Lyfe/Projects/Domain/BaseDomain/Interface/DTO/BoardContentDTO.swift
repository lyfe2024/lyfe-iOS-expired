import Foundation

// MARK: - BoardContent
public struct BoardContent: Decodable {
    public let id: Int
    public var title, content: String
    public var boardType: BoardType
    public var createdAt, updatedAt: String
    public var user: User
    public var whiskyCount, commentCount: Int
    public var isLike: Bool
}

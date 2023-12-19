
import Foundation

// MARK: - CommentList
public struct Comment: Decodable {
    public let id: Int
    public var content: String
    public var user: User
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id, content, user
        case createdAt
    }
}

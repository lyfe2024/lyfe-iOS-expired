
import Foundation

// MARK: - BoardPicture
public struct BoardPicture: Decodable {
    public let id: Int
    public var title: String
    public var picture: Picture
    public var date: String
    public var boardType: BoardType
    public var user: User
    public var whiskyCount, commentCount: Int
}

import Foundation

// MARK: - BoardPictureList
public struct BoardPictureList: Decodable {
    public let id: Int
    public var title: String
    public var picture: Picture
    public var date, boardType: String
    public var user: User
    public var whiskyCount, commentCount: Int
}

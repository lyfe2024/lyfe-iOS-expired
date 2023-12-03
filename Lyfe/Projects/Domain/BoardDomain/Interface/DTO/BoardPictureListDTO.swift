import Foundation

// MARK: - BoardPictureList
public struct BoardPictureList: Decodable {
    public let id: Int
    public let title: String
    public let picture: Picture
    public let date, boardType: String
    public let user: User
    public let whiskyCount, commentCount: Int
}

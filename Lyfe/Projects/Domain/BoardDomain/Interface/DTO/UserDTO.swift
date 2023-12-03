import Foundation

// MARK: - User
public struct User: Decodable {
    public let id: Int
    public let username: String
    public let profile: String
}

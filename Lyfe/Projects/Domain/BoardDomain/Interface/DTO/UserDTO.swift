import Foundation

// MARK: - User
public struct User: Decodable {
    public let id: Int
    public var username: String
    public var profile: String
}

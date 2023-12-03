import Foundation

// MARK: - Picture
public struct Picture: Decodable {
    public let height, width: Int
    public let pictureURL: String
    
    enum CodingKeys: String, CodingKey {
        case height, width
        case pictureURL = "pictureUrl"
    }
}

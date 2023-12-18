import Foundation

// MARK: - Picture
public struct Picture: Decodable {
    public var height, width: Int
    public var pictureURL: String
    
    enum CodingKeys: String, CodingKey {
        case height, width
        case pictureURL = "pictureUrl"
    }
}

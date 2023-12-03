import BaseDomainInterface
import Foundation

extension BoardsDTO {
    public enum Picture {}
}

extension BoardsDTO.Picture {
    public struct LatestResponse: Decodable {
        public let result: BoardPictureList
        public let page: Page
    }
}

extension BoardsDTO.Picture.LatestResponse {
    
    // MARK: - BoardPictureList
    public struct BoardPictureList: Decodable {
        public let id: Int
        public let title: String
        public let picture: Picture
        public let date, boardType: String
        public let user: User
        public let whiskyCount, commentCount: Int
    }
    
    // MARK: - Picture
    public struct Picture: Decodable {
        public let height, width: Int
        public let pictureURL: String
        
        enum CodingKeys: String, CodingKey {
            case height, width
            case pictureURL = "pictureUrl"
        }
    }
    
    // MARK: - User
    public struct User: Decodable {
        public let id: Int
        public let username: String
        public let profile: String
    }
}

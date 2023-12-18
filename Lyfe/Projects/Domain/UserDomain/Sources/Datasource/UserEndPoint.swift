
import NetworkingInterface
import UserDomainInterface
import Foundation

public enum UserEndPoint {
    case me // 내 정보 조회
    case updateMe(nickname: String, imageURL: String) // 내 정보 수정
    case checkNickname(_ nickname: String) // 닉네임 중복 확인
    case myPhotos // 나의 신청사진 목록
    case myContents // 나의 고민글 목록
}

extension UserEndPoint: EndPointProvider {
    public var scheme: String {
        return "https"
    }
    
    public var baseURL: String {
        return "//52.79.169.145/v1/" + "users/"
    }
    
    public var path: String {
        switch self {
        case .me: return "me"
        case .updateMe: return "me"
        case .checkNickname(let nickname): return "check-nickname/\(nickname)"
        case .myPhotos: return "me/boards/picture"
        case .myContents: return "me/boards/content"
        }
    }
    
    public var method: NetworkingInterface.RequestMethod {
        switch self {
        case .updateMe: return .patch
        default: return .get
        }
    }
    
    public var token: String {
        return ""
    }
    
    public var queryItems: [URLQueryItem]? {
        switch self {
        default: return nil
        }
    }
    
    public var body: [String : Any]? {
        switch self {
        case .updateMe(let nickname, let imageURL):
            return [
                "nickname": nickname,
                "profileImage": imageURL
            ]
        default: return nil
        }
    }
    
    public var mockFile: String? {
        return nil
    }
    
    public var multipart: NetworkingInterface.MultipartRequest? {
        return nil
    }
    
    public var uploadData: Data? {
        return nil
    }
    
    
}

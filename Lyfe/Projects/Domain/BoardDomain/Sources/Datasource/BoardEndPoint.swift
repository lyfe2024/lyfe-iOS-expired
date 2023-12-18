import NetworkingInterface
import BoardDomainInterface
import Foundation

public enum BoardEndPoint {
    case pictureLatest // 업데이트 예정
    case contentLatest // 업데이트 예정
    case pictureHot // 업데이트 예정
    case contentHot // 업데이트 예정
    
    case detail(id: Int) // 글 상세 조회
    
    case write(_ param: BoardsDTO.Write.Request) // 글 작성
    case update(id: Int, param: BoardsDTO.Update.Request) // 글 업데이트
    
    case list(id: Int, size: Int) // 글 리스트 조회
}

extension BoardEndPoint: EndPointProvider {
    public var scheme: String {
        return "https"
    }
    
    public var baseURL: String {
        return "//52.79.169.145/v1/" + "boards/"
    }
    
    public var path: String {
        switch self {
        case .pictureLatest: return "picture/latest"
        case .contentLatest: return "content/latest"
        case .pictureHot: return "picture/hot"
        case .contentHot: return "content/hot"
        case .detail(let id): return "\(id)"
        case .write: return ""
        case .update(let id, _): return "\(id)"
        case .list(let id, let size): return ""
        }
    }
    
    public var method: NetworkingInterface.RequestMethod {
        switch self {
        case .write: return .post
        case .update: return .put
        default: return .get
        }
    }
    
    public var token: String {
        return ""
    }
    
    public var queryItems: [URLQueryItem]? {
        switch self {
        case .list(let id, let size):
            return [
                .init(name: "cursorId", value: "\(id)"),
                .init(name: "size", value: "\(size)"),
            ]
        default: return nil
        }
    }
    
    public var body: [String : Any]? {
        switch self {
        case .write(let param):
            return [
                "title": param.title,
                "content": param.content,
                "boardType": param.boardType.rawValue,
                "userId": param.userID,
                "topicId": param.topicID
            ]
        case .update(_, let param):
            return [
                "title": param.title,
                "content": param.content
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


import NetworkingInterface
import CommentDomainInterface
import Foundation

public enum CommentEndPoint {
    case list(boardID: Int, cursorID: Int) // 댓글 조회
    case update(param: CommentsDTO.Update.Request) // 댓글 수정
    case create(param: CommentsDTO.Create.Request)
}

extension CommentEndPoint: EndPointProvider {
    public var scheme: String {
        return "https"
    }
    
    public var baseURL: String {
        return "//52.79.169.145/v1/" + "comments/"
    }
    
    public var path: String {
        switch self {
        case .list: return "latest"
        case .update(let param): return "\(param.commentID)"
        case .create(let param): return ""
        }
    }
    
    public var method: RequestMethod {
        switch self {
        case .update: return .put
        case .create: return .post
        default: return .get
        }
    }
    
    public var token: String {
        return ""
    }
    
    public var queryItems: [URLQueryItem]? {
        switch self {
        case .list(let boardID, let cursorID):
            return [
                .init(name: "comment_board_id", value: String(boardID)),
                .init(name: "cursorId", value: String(cursorID)),
            ]
        case .create(let param):
            return [
                .init(name: "comment_board_id", value: String(param.boardID))
            ]
        default: return nil
        }
    }
    
    public var body: [String : Any]? {
        switch self {
        case .update(let param):
            return [
                "content": param.content
            ]
        case .create(let param):
            return [
                "content": param.content
            ]
        default: return nil
        }
    }
    
    public var mockFile: String? {
        return nil
    }
    
    public var multipart: MultipartRequest? {
        return nil
    }
    
    public var uploadData: Data? {
        return nil
    }
    
    
}

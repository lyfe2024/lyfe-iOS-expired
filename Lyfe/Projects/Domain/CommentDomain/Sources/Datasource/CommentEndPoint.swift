
import NetworkingInterface
import CommentDomainInterface
import Foundation

public enum CommentEndPoint {
    
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
        }
    }
    
    public var method: RequestMethod {
        switch self {
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

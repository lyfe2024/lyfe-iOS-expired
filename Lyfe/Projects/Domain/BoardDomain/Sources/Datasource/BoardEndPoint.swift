import NetworkingInterface
import Foundation

public enum BoardEndPoint {
    case pictureLatest
    case contentLatest
    case pictureHot
    case contentHot
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
        case .pictureLatest:
            return "picture/latest"
        case .contentLatest:
            return "content/latest"
        case .pictureHot:
            return "picture/hot"
        case .contentHot:
            return "content/hot"
        }
    }
    
    public var method: NetworkingInterface.RequestMethod {
        switch self {
        case .pictureLatest:
            return .get
        case .contentLatest:
            return .get
        case .pictureHot:
            return .get
        case .contentHot:
            return .get
        }
    }
    
    public var token: String {
        return ""
    }
    
    public var queryItems: [URLQueryItem]? {
        switch self {
        case .pictureLatest:
            return nil
        case .contentLatest:
            return nil
        case .pictureHot:
            return nil
        case .contentHot:
            return nil
        }
    }
    
    public var body: [String : Any]? {
        switch self {
        case .pictureLatest:
            return nil
        case .contentLatest:
            return nil
        case .pictureHot:
            return nil
        case .contentHot:
            return nil
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

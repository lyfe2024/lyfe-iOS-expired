import NetworkingInterface
import BaseDomainInterface
import Foundation

public enum CommonEndPoint {
    case uploadImage(CommonDTO.UploadImage.Request) // 업데이트 예정
}

extension CommonEndPoint: EndPointProvider {
    public var scheme: String {
        return "https"
    }
    
    public var baseURL: String {
        return "//52.79.169.145/v1/"
    }
    
    public var path: String {
        switch self {
        case .uploadImage: return "images/get-upload-url"
        }
    }
    
    public var method: NetworkingInterface.RequestMethod {
        switch self {
        default: return .get
        }
    }
    
    public var token: String {
        return ""
    }
    
    public var queryItems: [URLQueryItem]? {
        switch self {
        case .uploadImage(let param):
            return [
                .init(name: "format", value: param.format),
                .init(name: "path", value: param.path),
            ]
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
    
    public var multipart: NetworkingInterface.MultipartRequest? {
        return nil
    }
    
    public var uploadData: Data? {
        switch self {
        case .uploadImage(let param): return param.image
        default: return nil
        }
    }
}


import Foundation

public enum CommentDomainError: Error {
    case load // 임시
}

extension CommentDomainError {
    public var errorDescription: String? {
        switch self {
        case .load:
            return nil
        }
    }
}


import Foundation

public enum UserDomainError: Error {
    case load // 임시
}

extension UserDomainError {
    public var errorDescription: String? {
        switch self {
        case .load:
            return nil
        }
    }
}

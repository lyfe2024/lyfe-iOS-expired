import Foundation

public enum BoardDomainError: Error {
    case load // 임시
}

extension BoardDomainError {
    public var errorDescription: String? {
        switch self {
        case .load:
            return nil
        }
    }
}

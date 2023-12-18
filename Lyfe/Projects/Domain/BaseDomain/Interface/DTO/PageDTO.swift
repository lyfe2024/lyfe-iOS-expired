import Foundation


// MARK: - Page
public struct Page: Decodable {
    public let size, number, totalElements, totalPages: Int
}

import Foundation

public protocol BoardRepository {
    func pictureLatest() async throws -> BoardsDTO.Picture.LatestResponse
    func contentLatest() async throws -> BoardsDTO.Content.LatestResponse
}

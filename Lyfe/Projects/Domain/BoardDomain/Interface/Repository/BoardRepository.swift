import Foundation

public protocol BoardRepository {
    var pictureLatest: @Sendable () async throws -> BoardsDTO.Picture.LatestResponse { get }
    var contentLatest: @Sendable () async throws -> BoardsDTO.Content.LatestResponse { get }
    var pictureHot: @Sendable () async throws -> BoardsDTO.Picture.HotResponse { get }
    var contentHot: @Sendable () async throws -> BoardsDTO.Content.HotResponse { get }
}

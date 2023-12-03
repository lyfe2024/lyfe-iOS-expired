import Foundation
import NetworkingInterface
import BoardDomainInterface
import Dependencies

public struct BoardClient: BoardRepository {
    public var pictureLatest: @Sendable () async throws -> BoardsDTO.Picture.LatestResponse
    public var contentLatest: @Sendable () async throws -> BoardsDTO.Content.LatestResponse
    public var pictureHot: @Sendable () async throws -> BoardsDTO.Picture.HotResponse
    public var contentHot: @Sendable () async throws -> BoardsDTO.Content.HotResponse
}


extension BoardClient: DependencyKey {
    static public var liveValue: BoardClient = Self(
        pictureLatest: {
            return try await APIClient().asyncRequest(
                endpoint: BoardEndPoint.pictureLatest,
                responseModel: BoardsDTO.Picture.LatestResponse.self
            )
        },
        contentLatest: {
            return try await APIClient().asyncRequest(
                endpoint: BoardEndPoint.contentLatest,
                responseModel: BoardsDTO.Content.LatestResponse.self
            )
        },
        pictureHot: {
            return try await APIClient().asyncRequest(
                endpoint: BoardEndPoint.pictureHot,
                responseModel: BoardsDTO.Picture.HotResponse.self
            )
        },
        contentHot: {
            return try await APIClient().asyncRequest(
                endpoint: BoardEndPoint.contentHot,
                responseModel: BoardsDTO.Content.HotResponse.self
            )
        }
    )
}

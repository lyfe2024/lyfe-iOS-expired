import Foundation
import NetworkingInterface
import BoardDomainInterface
import BaseDomainInterface
import Dependencies

public struct BoardClient: BoardRepository {
    public var pictureLatest: @Sendable () async throws -> BoardsDTO.Picture.LatestResponse
    public var contentLatest: @Sendable () async throws -> BoardsDTO.Content.LatestResponse
    public var pictureHot: @Sendable () async throws -> BoardsDTO.Picture.HotResponse
    public var contentHot: @Sendable () async throws -> BoardsDTO.Content.HotResponse
    
    public var detail: @Sendable (_ id: Int) async throws -> BoardsDTO.DetailResponse
    public var write: @Sendable (_ param: BoardsDTO.Write.Request) async throws -> CommonDTO.Response
    public var update: @Sendable (_ id: Int, _ param: BoardsDTO.Update.Request) async throws -> CommonDTO.Response
    
    public var list: @Sendable (_ id: Int) async throws -> BoardsDTO.List.Response
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
        }, 
        detail: { id in
            return try await APIClient().asyncRequest(
                endpoint: BoardEndPoint.detail(id: id),
                responseModel: BoardsDTO.DetailResponse.self
            )
        }, 
        write: { param in
            return try await APIClient().asyncRequest(
                endpoint: BoardEndPoint.write(param),
                responseModel: CommonDTO.Response.self
            )
        }, 
        update: { id, param in
            return try await APIClient().asyncRequest(
                endpoint: BoardEndPoint.update(id: id, param: param),
                responseModel: CommonDTO.Response.self
            )
        },
        list: { id in
            return try await APIClient().asyncRequest(
                endpoint: BoardEndPoint.list(id: id, size: 10),
                responseModel: BoardsDTO.List.Response.self
            )
        }
    )
}

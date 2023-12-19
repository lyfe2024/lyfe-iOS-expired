import Foundation
import BaseDomainInterface

public protocol BoardRepository {
    var pictureLatest: @Sendable () async throws -> BoardsDTO.Picture.LatestResponse { get }
    var contentLatest: @Sendable () async throws -> BoardsDTO.Content.LatestResponse { get }
    var pictureHot: @Sendable () async throws -> BoardsDTO.Picture.HotResponse { get }
    var contentHot: @Sendable () async throws -> BoardsDTO.Content.HotResponse { get }
    var detail: @Sendable (_ id: Int) async throws -> BoardsDTO.DetailResponse { get }
    var write: @Sendable (_ param: BoardsDTO.Write.Request) async throws -> CommonDTO.Response { get }
    var update: @Sendable (_ id: Int, _ param: BoardsDTO.Update.Request) async throws -> CommonDTO.Response { get }
    
    var list: @Sendable (_ id: Int) async throws -> BoardsDTO.List.Response { get }
    var like: @Sendable (_ id: Int) async throws -> CommonDTO.Response { get }
}

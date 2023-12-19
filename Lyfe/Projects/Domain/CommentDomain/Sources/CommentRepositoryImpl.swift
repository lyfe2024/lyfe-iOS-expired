
import Foundation
import NetworkingInterface
import CommentDomainInterface
import Dependencies

public struct CommentClient: CommentRepository {
    public var list: @Sendable (_ boardID: Int, _ cursorID: Int) async throws -> CommentsDTO.List.Response
    public var update: @Sendable (_ param: CommentsDTO.Update.Request) async throws -> CommentsDTO.Update.Response
    public var create: @Sendable (_ param: CommentsDTO.Create.Request) async throws -> CommentsDTO.Create.Response
}


extension CommentClient: DependencyKey {
    static public var liveValue: CommentClient = Self(
        list: { boardID, cursorID in
            return try await APIClient().asyncRequest(
                endpoint: CommentEndPoint.list(boardID: boardID, cursorID: cursorID),
                responseModel: CommentsDTO.List.Response.self
            )
        },
        update: { param in
            return try await APIClient().asyncRequest(
                endpoint: CommentEndPoint.update(param: param),
                responseModel: CommentsDTO.Update.Response.self
            )
        },
        create: { param in
            return try await APIClient().asyncRequest(
                endpoint: CommentEndPoint.create(param: param),
                responseModel: CommentsDTO.Create.Response.self
            )
        }
    )
}

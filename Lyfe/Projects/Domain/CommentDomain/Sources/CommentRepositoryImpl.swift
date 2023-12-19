
import Foundation
import NetworkingInterface
import CommentDomainInterface
import Dependencies

public struct CommentClient: CommentRepository {
    public var list: @Sendable (_ boardID: Int, _ cursorID: Int) async throws -> CommentsDTO.List.Response
    
    public var update: @Sendable (_ id: Int, _ content: String) async throws -> CommentsDTO.Update.Response
    
    
}


extension CommentClient: DependencyKey {
    static public var liveValue: CommentClient = Self(
        list: { boardID, cursorID in
            return try await APIClient().asyncRequest(
                endpoint: CommentEndPoint.list(boardID: boardID, cursorID: cursorID),
                responseModel: CommentsDTO.List.Response.self
            )
        },
        update: { id, content in
            return try await APIClient().asyncRequest(
                endpoint: CommentEndPoint.update(id: id, content: content),
                responseModel: CommentsDTO.Update.Response.self
            )
        }
        
    )
}

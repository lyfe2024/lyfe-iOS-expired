
import Foundation

public protocol CommentRepository {
    var list: @Sendable (_ boardID: Int, _ cursorID: Int) async throws -> CommentsDTO.List.Response { get }
    var update: @Sendable (_ param: CommentsDTO.Update.Request) async throws -> CommentsDTO.Update.Response { get }
    var create: @Sendable (_ param: CommentsDTO.Create.Request) async throws -> CommentsDTO.Create.Response { get }
}

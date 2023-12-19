
import Foundation

public protocol CommentRepository {
    var list: @Sendable (_ boardID: Int, _ cursorID: Int) async throws -> CommentsDTO.List.Response { get }
    var update: @Sendable (_ id: Int, _ content: String) async throws -> CommentsDTO.Update.Response { get }
}

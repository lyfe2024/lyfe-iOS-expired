
import Foundation

public protocol CommentRepository {
    var list: @Sendable (_ boardID: Int, _ cursorID: Int) async throws -> CommentsDTO.List.Response { get }
}

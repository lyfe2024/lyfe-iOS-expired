
import Foundation
import BaseDomainInterface

public protocol CommentRepository {
    var list: @Sendable (_ boardID: Int, _ cursorID: Int) async throws -> CommentsDTO.List.Response { get }
    var update: @Sendable (_ param: CommentsDTO.Update.Request) async throws -> CommonDTO.Response { get }
    var create: @Sendable (_ param: CommentsDTO.Create.Request) async throws -> CommonDTO.Response { get }
}

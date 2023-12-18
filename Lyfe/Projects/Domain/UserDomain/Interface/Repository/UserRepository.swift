
import Foundation

public protocol UserRepository {
    var me: @Sendable () async throws -> UsersDTO.Me.Response { get }
    var updateMe: @Sendable (_ nickname: String, _ imageURL: String) async throws -> UsersDTO.Me.Response { get }
    var checkNickname: @Sendable (_ nickname: String) async throws -> UsersDTO.CheckNickname.Response { get }
    var myPhotos: @Sendable () async throws -> UsersDTO.MyPhotos.Response { get }
    var myContents: @Sendable () async throws -> UsersDTO.MyContents.Response { get }
}

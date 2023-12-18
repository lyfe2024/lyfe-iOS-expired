
import Foundation
import NetworkingInterface
import UserDomainInterface
import Dependencies

public struct UserClient: UserRepository {
    public var me: @Sendable () async throws -> UsersDTO.Me.Response
    public var updateMe: @Sendable (_ nickname: String, _ imageURL: String) async throws -> UsersDTO.Me.Response
    
    public var checkNickname: @Sendable (String) async throws -> UsersDTO.CheckNickname.Response
    
    public var myPhotos: @Sendable () async throws -> UsersDTO.MyPhotos.Response
    public var myContents: @Sendable () async throws -> UsersDTO.MyContents.Response
}


extension UserClient: DependencyKey {
    static public var liveValue: UserClient = Self(
        me: {
            return try await APIClient().asyncRequest(
                endpoint: UserEndPoint.me,
                responseModel: UsersDTO.Me.Response.self
            )
        },
        updateMe: { nickname, imageURL in
            return try await APIClient().asyncRequest(
                endpoint: UserEndPoint.updateMe(nickname: nickname, imageURL: imageURL),
                responseModel: UsersDTO.Me.Response.self
            )
        },
        checkNickname: { nickname in
            return try await APIClient().asyncRequest(
                endpoint: UserEndPoint.checkNickname(nickname),
                responseModel: UsersDTO.CheckNickname.Response.self
            )
        },
        myPhotos: {
            return try await APIClient().asyncRequest(
                endpoint: UserEndPoint.myPhotos,
                responseModel: UsersDTO.MyPhotos.Response.self
            )
        },
        myContents: {
            return try await APIClient().asyncRequest(
                endpoint: UserEndPoint.myContents,
                responseModel: UsersDTO.MyContents.Response.self
            )
        }
    )
}

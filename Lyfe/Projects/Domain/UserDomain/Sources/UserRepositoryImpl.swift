
import Foundation
import NetworkingInterface
import UserDomainInterface
import Dependencies

public struct UserClient: UserRepository {
//    public var pictureLatest: @Sendable () async throws -> BoardsDTO.Picture.LatestResponse
}


extension UserClient: DependencyKey {
    static public var liveValue: UserClient = Self(
    
    )
}

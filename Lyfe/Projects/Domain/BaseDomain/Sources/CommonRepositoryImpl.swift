import Foundation
import NetworkingInterface
import BaseDomainInterface
import Dependencies

public struct CommonClient: CommonRepository {
    public var uploadImage: @Sendable (CommonDTO.UploadImage.Request) async throws -> CommonDTO.UploadImage.Response
    public var topics: @Sendable () async throws -> TopicsDTO.Response
}


extension CommonClient: DependencyKey {
    static public var liveValue: CommonClient = Self(
        uploadImage: { param in
            return try await APIClient().asyncUpload(
                endpoint: CommonEndPoint.uploadImage(param),
                responseModel: CommonDTO.UploadImage.Response.self
            )
        },
        topics: {
            return try await APIClient().asyncRequest(
                endpoint: CommonEndPoint.topcis,
                responseModel: TopicsDTO.Response.self
            )
        }
    )
}

import Foundation
import NetworkingInterface
import BaseDomainInterface
import Dependencies

public struct CommonClient: CommonRepository {
    public var uploadImage: @Sendable (CommonDTO.UploadImage.Request) async throws -> CommonDTO.UploadImage.Response
    public var topics: @Sendable (_ date: String?) async throws -> TopicsDTO.Response
    public var notifications: @Sendable () async throws -> NotificationsDTO.Response
    public var policyTerm: @Sendable () async throws -> PolicysDTO.Response
    public var policyPersonalInfoAgreement: @Sendable () async throws -> PolicysDTO.Response
}


extension CommonClient: DependencyKey {
    static public var liveValue: CommonClient = Self(
        uploadImage: { param in
            return try await APIClient().asyncUpload(
                endpoint: CommonEndPoint.uploadImage(param),
                responseModel: CommonDTO.UploadImage.Response.self
            )
        },
        topics: { date in
            return try await APIClient().asyncRequest(
                endpoint: CommonEndPoint.topcis(date: date),
                responseModel: TopicsDTO.Response.self
            )
        },
        notifications: {
            return try await APIClient().asyncRequest(
                endpoint: CommonEndPoint.notifications,
                responseModel: NotificationsDTO.Response.self
            )
        },
        policyTerm: {
            return try await APIClient().asyncRequest(
                endpoint: CommonEndPoint.policyTerm,
                responseModel: PolicysDTO.Response.self
            )
        },
        policyPersonalInfoAgreement: {
            return try await APIClient().asyncRequest(
                endpoint: CommonEndPoint.policyPersonalInfoAgreement,
                responseModel: PolicysDTO.Response.self
            )
        }
    )
}

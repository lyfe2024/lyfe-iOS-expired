import Foundation

public protocol CommonRepository {
    var uploadImage: @Sendable (CommonDTO.UploadImage.Request) async throws ->
    CommonDTO.UploadImage.Response { get }
    var topics: @Sendable (_ date: String?) async throws ->
    TopicsDTO.Response { get }
    var notifications: @Sendable () async throws -> NotificationsDTO.Response { get }
    var policyTerm: @Sendable () async throws -> PolicysDTO.Response { get }
    var policyPersonalInfoAgreement: @Sendable () async throws -> PolicysDTO.Response { get }
}

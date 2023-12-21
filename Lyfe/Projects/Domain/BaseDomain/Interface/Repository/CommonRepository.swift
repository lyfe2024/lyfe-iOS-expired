import Foundation

public protocol CommonRepository {
    var uploadImage: @Sendable (CommonDTO.UploadImage.Request) async throws ->
    CommonDTO.UploadImage.Response { get }
    var topics: @Sendable () async throws ->
    TopicsDTO.Response { get }
}


import Foundation
import NetworkingInterface
import CommentDomainInterface
import Dependencies

public struct CommentClient: CommentRepository {
    
}


extension CommentClient: DependencyKey {
    static public var liveValue: CommentClient = Self(
        
    )
}

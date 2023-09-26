import ComposableArchitecture
import Foundation

public struct SplashCore: Reducer {
    public init() {}
    
    public struct State: Equatable {
        public let id: UUID = .init()
        
        public init() {}
    }
    
    public enum Action: Equatable {
        case onAppear
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .none
            }
        }
    }
}

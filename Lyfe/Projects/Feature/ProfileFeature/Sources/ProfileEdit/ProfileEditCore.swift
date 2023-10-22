import ComposableArchitecture
import Foundation

public struct ProfileEditCore: Reducer {
    public init() {}
    
    public struct State: Equatable {
        public let id: UUID = .init()
        
        public init() {}
    }
    
    public enum Action: Equatable {
        case onAppear
        case dismiss
    }
    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .onAppear:
                return .none
            case .dismiss:
                // handle by Coordinator
                return .none
            }
        }
    }
}

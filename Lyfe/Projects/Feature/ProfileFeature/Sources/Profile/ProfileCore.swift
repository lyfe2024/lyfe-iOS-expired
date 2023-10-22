import ComposableArchitecture
import Foundation

public struct ProfileCore: Reducer {
    public init() {}
    
    public struct State: Equatable {
        public let id: UUID = .init()
        
        public init() {}
    }
    
    public enum Action: Equatable {
        case onAppear
        case pushProfileEdit
    }
    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .onAppear:
                return .none
            case .pushProfileEdit:
                // handle by Coordinator
                print("pushProfileEdit")
                return .none
            }
        }
    }
}

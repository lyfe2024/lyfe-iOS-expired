import ComposableArchitecture
import Foundation

public struct ProfileCore: Reducer {
    public init() {}
    
    public struct State: Equatable {
        public static func == (lhs: ProfileCore.State, rhs: ProfileCore.State) -> Bool {
            return lhs.id == rhs.id
        }
        
        public let id: UUID = .init()
        
        public init() {}
    }
    
    public enum Action: Equatable {
        case onAppear
    }
    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .onAppear:
                return .none
            }
        }
    }
}

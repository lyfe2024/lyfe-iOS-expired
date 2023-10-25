import ComposableArchitecture
import Foundation

public struct ProfileEditCore: Reducer {
    public init() {}
    
    public struct State: Equatable {
        public let id: UUID = .init()
        
        public init() {}
        
        @BindingState var nickname: String = ""
    }
    
    public enum Action: Equatable, BindableAction {
        case onAppear
        case dismiss
        case binding(BindingAction<State>)
    }
    
    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce<State, Action> { state, action in
            switch action {
            case .onAppear:
                return .none
            case .dismiss:
                // handle by Coordinator
                return .none
            case .binding:
                // Binding
                return .none
            }
        }
    }
}

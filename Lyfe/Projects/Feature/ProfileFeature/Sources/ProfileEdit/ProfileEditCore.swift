import ComposableArchitecture
import Foundation

public struct ProfileEditCore: Reducer {
    public init() {}
    
    public struct State: Equatable {
        public let id: UUID = .init()
        
        public init() {}
        
        @BindingState public var nickname: String = ""
        public var isEnabledDoneButton: Bool = false
        public var profileImageData: Data?
    }
    
    public enum Action: Equatable, BindableAction {
        case onAppear
        case dismiss
        
        case loadProfileImageData(Data?)
        
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
                
            case .loadProfileImageData(let data):
                state.profileImageData = data
                return .none
                
            case .binding(\.$nickname):
                state.isEnabledDoneButton = state.nickname.count > 0
                return .none
            case .binding:
                // Binding
                return .none
            }
        }
    }
}

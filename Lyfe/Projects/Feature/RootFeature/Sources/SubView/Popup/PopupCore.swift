import Foundation
import ComposableArchitecture

public struct PopupCore: Reducer {
    public init() {}
    
    public struct State: Equatable {
        let id: String
        var text: String
        var content: String?
        
        var cancel: ButtonState?
        var ok: ButtonState
    }
    
    public enum Action: Equatable {
        case ok(String)
        case cancel(String)
    }
    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .ok:
                return .none
            case .cancel:
                return .none
            }
        }
    }
}

extension PopupCore {
    struct ButtonState: Equatable {
        var text: String
        
        public init(text: String) {
            self.text = text
        }
    }
}

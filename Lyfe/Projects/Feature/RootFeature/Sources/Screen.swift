import ComposableArchitecture
import Foundation
import SwiftUI
import SplashFeature

public struct Screen: Reducer {
    public enum Action {
        case splash(SplashCore.Action)
    }
    
    public enum State: Equatable, Identifiable {
        case splash(SplashCore.State)
        
        public var id: UUID {
            switch self {
            case .splash(let state):
                return state.id
            }
        }
    }
    
    public var body: some ReducerOf<Self> {
        Scope(state: /State.splash, action: /Action.splash) {
            SplashCore()
        }
    }
}

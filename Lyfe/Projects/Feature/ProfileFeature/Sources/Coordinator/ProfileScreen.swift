import ComposableArchitecture
import Foundation
import SwiftUI

public struct ProfileScreen: Reducer, Equatable {
    public enum Action: Equatable {
        case profile(ProfileCore.Action)
    }
    
    public enum State: Equatable, Identifiable {
        case profile(ProfileCore.State)
        
        public var id: UUID {
            switch self {
            case .profile(let state):
                return state.id
            }
        }
    }
    
    public var body: some ReducerOf<Self> {
        Scope(state: /State.profile, action: /Action.profile) {
            ProfileCore()
        }
    }
}

import ComposableArchitecture
import Foundation
import SwiftUI

public struct ProfileScreen: Reducer, Equatable {
    public enum Action: Equatable {
        case profile(ProfileCore.Action)
        case profileEdit(ProfileEditCore.Action)
        case setup(SetupCore.Action)
    }
    
    public enum State: Equatable, Identifiable {
        case profile(ProfileCore.State)
        case profileEdit(ProfileEditCore.State)
        case setup(SetupCore.State)
        
        public var id: UUID {
            switch self {
            case .profile(let state):
                return state.id
            case .profileEdit(let state):
                return state.id
            case .setup(let state):
                return state.id
            }
        }
    }
    
    public var body: some ReducerOf<Self> {
        Scope(state: /State.profile, action: /Action.profile) {
            ProfileCore()
        }
        Scope(state: /State.profileEdit, action: /Action.profileEdit) {
            ProfileEditCore()
        }
        Scope(state: /State.setup, action: /Action.setup) {
            SetupCore()
        }
    }
}

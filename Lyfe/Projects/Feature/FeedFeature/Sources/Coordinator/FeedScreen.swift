import ComposableArchitecture
import Foundation
import SwiftUI

public struct FeedScreen: Reducer, Equatable {
    public enum State: Equatable, Identifiable {
        case feedHome(FeedHomeCore.State)
        
        public var id: UUID {
            switch self {
            case .feedHome(let state):
                return state.id
            }
            
        }
    }
    
    public enum Action: Equatable {
        case feedHome(FeedHomeCore.Action)
    }
    
    public var body: some ReducerOf<Self> {
        Scope(state: /State.feedHome, action: /Action.feedHome) {
            FeedHomeCore()
        }
    }
}

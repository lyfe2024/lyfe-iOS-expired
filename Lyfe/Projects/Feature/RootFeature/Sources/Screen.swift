import ComposableArchitecture
import Foundation
import SwiftUI

struct Screen: Reducer {
    enum Action {
        case home(HomeCore.Action)
    }
    
    enum State: Equatable, Identifiable {
        case home(HomeCore.State)
        
        var id: UUID {
            switch self {
            case .home(let state):
                return state.id
            }
        }
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: /State.home, action: /Action.home) {
            HomeCore()
        }
    }
}

// 예시
struct HomeCore: Reducer {
  struct State: Equatable {
    let id = UUID()
  }

  enum Action {
    case startTapped
  }

  var body: some ReducerOf<Self> {
    EmptyReducer()
  }
}

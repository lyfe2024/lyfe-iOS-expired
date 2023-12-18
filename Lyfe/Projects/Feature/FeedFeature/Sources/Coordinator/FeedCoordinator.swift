import SwiftUI
import ComposableArchitecture
import TCACoordinators

public struct FeedCoordinator: Reducer {
    public init() {}
    
    public struct State: Equatable, IdentifiedRouterState {
        public let id: UUID = .init()
        public var routes: IdentifiedArrayOf<Route<FeedScreen.State>>
        
        public init() {
            self.routes = [
                .root(.feedHome(.init()), embedInNavigationView: true)
            ]
        }
    }
    
    public indirect enum Action: Equatable, IdentifiedRouterAction {
        case routeAction(_ id: FeedScreen.State.ID, action: FeedScreen.Action)
        case updateRoutes(IdentifiedArrayOf<Route<FeedScreen.State>>)
    }
    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case.routeAction(_, action: .feedHome(.photoRequest)):
                print("move to photo request")
                break
            case.routeAction(_, action: .feedHome(.moveToDetail)):
                print("move to detail")
                break
            case.routeAction(_, action: .feedHome(.moveToLogin)):
                print("move to login")
                break
            default:
                break
            }
            return .none
        }
    }
}


import SwiftUI
import ComposableArchitecture
import TCACoordinators

public struct ProfileCoordinator: Reducer {
    public init() {}
    
    public struct State: Equatable, IdentifiedRouterState {
        public let id: UUID = .init()
        public var routes: IdentifiedArrayOf<Route<ProfileScreen.State>>
        
        public init() {
            self.routes = [
                .root(.profile(.init()), embedInNavigationView: false)
            ]
        }
    }
    
    public indirect enum Action: Equatable, IdentifiedRouterAction {
        case routeAction(ProfileScreen.State.ID, action: ProfileScreen.Action)
        case updateRoutes(IdentifiedArrayOf<Route<ProfileScreen.State>>)
    }
    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .routeAction(_, action: let action):
                print(action)
                break
            case .updateRoutes(_):
                break
            }
            return .none
        }
    }
}

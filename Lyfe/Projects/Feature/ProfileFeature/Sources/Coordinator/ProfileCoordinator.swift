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
                .root(.profile(.init()), embedInNavigationView: true)
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
            case .routeAction(_, action: .profile(.pushProfileEdit)):
                let profileEditState = ProfileEditCore.State.init()
                state.routes.push(.profileEdit(profileEditState))
            case .routeAction(_, action: .profileEdit(.dismiss)):
                state.routes.goBack()
            case .updateRoutes(_):
                break
            default:
                break
            }
            return .none
        }
        .forEachRoute {
            ProfileScreen()
        }
        ._printChanges()
    }
}

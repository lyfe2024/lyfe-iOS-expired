import ComposableArchitecture
import SwiftUI
import TCACoordinators
import SplashFeature

//public struct RootView: View {
//
//}
public struct RootCoordinator: Reducer {
    public enum DeepLink {

    }
    
    public enum Tab: Hashable {
        case home
    }
    public struct State: Equatable {
        static let initialState = State(
            splash: .init(),
            selectedTab: .home
        )
        
        var splash: SplashCore.State
        
        var selectedTab: Tab
    }
    
    public enum Action {
        case splash(SplashCore.Action)
        
        case deeplinkOpened(DeepLink)
        case tabSelected(Tab)
    }
    
    public var body: some ReducerOf<Self> {
        Scope(state: \.splash, action: /Action.splash) {
            SplashCore()
        }
        Reduce<State, Action> { state, action in
            switch action {
            case .splash(.onAppear):
                Task.init { @MainActor in
                    try await Task.sleep(nanoseconds: 1_000_000_000)
                    print("splash onAppear end")
                }
            case .deeplinkOpened:
                // TODO: Deeplink
                break
            case .tabSelected(let tab):
                state.selectedTab = tab
            }
            return .none
        }
    }
}


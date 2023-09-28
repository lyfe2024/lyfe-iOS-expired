import ComposableArchitecture
import SwiftUI
import TCACoordinators

public struct RootCoordinator: Reducer {
    public init() {}
    
    public struct State: Equatable {
        public init(splash: SplashCore.State, selectedTab: Constant.Tab) {
            self.splash = splash
            self.selectedTab = selectedTab
        }
        
        static let initialState = State(
            splash: .init(),
            selectedTab: .home
        )
        
        var splash: SplashCore.State
        
        var selectedTab: Constant.Tab
    }
    
    public enum Action {
        case splash(SplashCore.Action)
        
        case deeplinkOpened(Constant.DeepLink)
        case tabSelected(Constant.Tab)
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

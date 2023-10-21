import ComposableArchitecture
import SwiftUI
import TCACoordinators
import DesignSystem
import ProfileFeature

public struct RootCoordinator: Reducer {
    public init() {}
    
    public struct State: Equatable {
        public init(splash: SplashCore.State, profile: ProfileCoordinator.State, selectedTab: Constant.Tab) {
            self.splash = splash
            self.profile = profile
            self.selectedTab = selectedTab
        }
        
        public static let initialState = State(
            splash: .init(),
            profile: .init(),
            selectedTab: .home
        )
        
        var splash: SplashCore.State
        var profile: ProfileCoordinator.State
        
        var selectedTab: Constant.Tab
        @BindingState var toast: Toast?
    }
    
    public enum Action: BindableAction, Equatable {
        case splash(SplashCore.Action)
        case profile(ProfileCoordinator.Action)
        
        case deeplinkOpened(Constant.DeepLink)
        case tabSelected(Constant.Tab)
        case setToast(ToastStyle)
        case onToast(Toast?)
        
        case binding(BindingAction<State>)
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
            case .profile:
                return .none
            case .deeplinkOpened:
                // TODO: Deeplink
                break
            case .tabSelected(let tab):
                state.selectedTab = tab
            case .onToast(let toast):
                state.toast = toast
                return .none
            case .setToast(let style):
                state.toast = .init(
                    type: style,
                    title: "토스트 테스트 타이틀",
                    message: "토스트 테스트 메시지",
                    direction: .top
                )
            case .binding:
                return .none
            }
            return .none
        }
    }
}

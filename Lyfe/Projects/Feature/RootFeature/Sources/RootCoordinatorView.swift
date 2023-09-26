import ComposableArchitecture
import SwiftUI
import TCACoordinators
import SplashFeature

public struct RootCoordinatorView: View {
    let store: StoreOf<RootCoordinator>
    
    public var body: some View {
        WithViewStore(store, observe: \.selectedTab) { viewStore in
            TabView(
                selection: viewStore.binding(get: { $0 }, send: RootCoordinator.Action.tabSelected)
            ) {
                // TODO: Tab
            }
        }
    }
}

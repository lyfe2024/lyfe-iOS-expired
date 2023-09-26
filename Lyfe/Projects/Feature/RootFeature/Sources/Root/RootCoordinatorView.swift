import ComposableArchitecture
import SwiftUI
import TCACoordinators

public struct RootCoordinatorView: View {
    let store: StoreOf<RootCoordinator>
    
    public init(store: StoreOf<RootCoordinator>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(store, observe: \.selectedTab) { viewStore in
            TabView(
                selection: viewStore.binding(get: { $0 }, send: RootCoordinator.Action.tabSelected)
            ) {
                // TODO: Tab
                VStack {
                    Text("RootCoordinator")
                }
                .background {
                    Color.white
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

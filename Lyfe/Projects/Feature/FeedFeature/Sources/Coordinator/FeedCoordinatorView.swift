import SwiftUI
import BaseFeatureInterface
import ComposableArchitecture
import TCACoordinators

public struct FeedCoordinatorView: View {
    let store: StoreOf<FeedCoordinator>
    
    public init(store: StoreOf<FeedCoordinator>) {
        self.store = store
    }
    
    public var body: some View {
        TCARouter(self.store) { screen in
            SwitchStore(screen) { screen in
                switch screen {
                case .feedHome:
                    CaseLet(/FeedScreen.State.feedHome, action: FeedScreen.Action.feedHome, then: FeedHomeView.init)
                }
            }
        }
    }
    
}


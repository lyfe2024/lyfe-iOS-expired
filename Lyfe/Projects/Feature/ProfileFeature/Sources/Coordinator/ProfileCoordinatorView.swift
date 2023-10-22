import SwiftUI
import BaseFeatureInterface
import TCACoordinators
import ComposableArchitecture

public struct ProfileCoordinatorView: View {
    let store: StoreOf<ProfileCoordinator>
    
    public init(store: StoreOf<ProfileCoordinator>) {
        self.store = store
    }
    
    public var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) { screen in
                switch screen {
                case .profile:
                    CaseLet(
                        /ProfileScreen.State.profile,
                         action: ProfileScreen.Action.profile,
                         then: ProfileView.init
                    )
                case .profileEdit:
                    CaseLet(
                        /ProfileScreen.State.profileEdit,
                         action: ProfileScreen.Action.profileEdit,
                         then: ProfileEditView.init
                    )
                }
            }
        }
    }
}

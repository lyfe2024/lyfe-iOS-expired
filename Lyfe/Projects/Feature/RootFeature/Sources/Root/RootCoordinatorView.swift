import ComposableArchitecture
import SwiftUI
import TCACoordinators
import DesignSystem
import ProfileFeature

public struct RootCoordinatorView: View {
    let store: StoreOf<RootCoordinator>
    
    public init(store: StoreOf<RootCoordinator>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(spacing: 0) {
                switch viewStore.selectedTab {
                case .home:
                    VStack(spacing: 20) {
                        Text(Constant.Tab.home.title)
                        
                        Button {
                            viewStore.send(.setToast(.error))
                        } label: {
                            Text("Error Toast")
                        }
                        
                        Button {
                            viewStore.send(.setToast(.warning))
                        } label: {
                            Text("Warning Toast")
                        }
                        
                        Button {
                            viewStore.send(.setToast(.info))
                        } label: {
                            Text("Info Toast")
                        }
                        
                        Button {
                            viewStore.send(.setToast(.success))
                        } label: {
                            Text("Success Toast")
                        }
                        
                        Button {
                            viewStore.send(.testPopupTap)
                        } label: {
                            Text("Popup Test")
                        }
                        
                        Spacer()
                    }
                    .tag(Constant.Tab.home)
                case .feed:
                    Text(Constant.Tab.feed.title)
                        .tag(Constant.Tab.feed)
                case .write:
                    Text(Constant.Tab.write.title)
                        .tag(Constant.Tab.write)
                case .alarm:
                    Text(Constant.Tab.alarm.title)
                        .tag(Constant.Tab.alarm)
                case .profile:
                    ProfileCoordinatorView(store: self.store.scope(
                        state: \.profile,
                        action: RootCoordinator.Action.profile
                    ))
                        .tag(Constant.Tab.profile)
                }
                
                
            }
            .frame(maxWidth: .infinity)
            .overlay(alignment: .bottom) {
                if self.showTabBar(viewStore.selectedTab) {
                    BottomTabBar(selectedTab: viewStore.binding(
                        get: { $0.selectedTab },
                        send: RootCoordinator.Action.tabSelected
                    ))
                    .padding(.horizontal, 20)
                }
            }
            .popup(
                isPresented: viewStore.$showPopup,
                onDismiss: { viewStore.send(.offPopup) },
                store: self.store.scope(state: \.popup, action: { .popup($0) })
            )
        }
    }
    
    func showTabBar(_ tab: Constant.Tab) -> Bool {
        let isProfileRootPage = tab == .profile && self.store.withState(\.profile.routes).count > 1
        if isProfileRootPage { return false }
        
        return true
    }
}

extension RootCoordinatorView {
    // MARK: Custom UI
    
}

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
                    }
                    .tag(Constant.Tab.home)
                case .all:
                    Text(Constant.Tab.all.title)
                        .tag(Constant.Tab.all)
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
                
                Spacer()
                
                if self.showTabBar(viewStore.selectedTab) {
                    TabBar(selectedTab: viewStore.binding(
                        get: { $0.selectedTab },
                        send: RootCoordinator.Action.tabSelected
                    ))
                    .padding(.bottom, 40)
                }
            }
            .ignoresSafeArea(edges: .bottom)
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
    
    struct TabBar: View {
        @Binding var selectedTab: Constant.Tab
        
        var body: some View {
            ZStack(alignment: .bottom) {
                VStack(alignment: .center) {
                    HStack(alignment: .center, spacing: 10) {
                        ForEach((Constant.Tab.allCases), id: \.self){ item in
                            Button{
                                self.selectedTab = item
                            } label: {
                                TabItem(
                                    title: item.title,
                                    iconName: item.iconName,
                                    isActive: item == self.selectedTab
                                )
                            }
                        }
                    }
                    .padding(.horizontal, 8)
                }
                .frame(maxWidth: .infinity)
            }
            .frame(height: 70)
            .background(.black)
            .cornerRadius(24)
            .padding(.horizontal, 20)
        }
    }
    
    struct TabItem: View {
        var title: String
        var iconName: String
        var isActive: Bool
        
        var body: some View {
            VStack(spacing: 2){
                Image(self.iconName)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(self.isActive ? .white : .black)
                    .frame(width: 20, height: 20)
                
                Text(self.title)
                    .font(.system(size: 14))
                    .foregroundColor(self.isActive ? .black : .white)
            }
            .frame(height: 50)
            .frame(minWidth: 54)
            .background(self.isActive ? .white : .black.opacity(0.6))
            .cornerRadius(8)
        }
    }
}

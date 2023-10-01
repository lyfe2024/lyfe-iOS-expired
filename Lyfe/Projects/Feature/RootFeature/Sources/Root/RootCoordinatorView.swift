import ComposableArchitecture
import SwiftUI
import TCACoordinators
import DesignSystem

public struct RootCoordinatorView: View {
    let store: StoreOf<RootCoordinator>
    
    public init(store: StoreOf<RootCoordinator>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(spacing: 0) {
                TabView(selection: viewStore.binding(
                    get: { $0.selectedTab },
                    send: RootCoordinator.Action.tabSelected
                )) {
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
                    
                    
                    Text(Constant.Tab.all.title)
                        .tag(Constant.Tab.all)
                    
                    Text(Constant.Tab.write.title)
                        .tag(Constant.Tab.write)
                    
                    Text(Constant.Tab.alarm.title)
                        .tag(Constant.Tab.alarm)
                    
                    Text(Constant.Tab.profile.title)
                        .tag(Constant.Tab.profile)
                }
                
                Spacer()
                
                TabBar(selectedTab: viewStore.binding(
                    get: { $0.selectedTab },
                    send: RootCoordinator.Action.tabSelected
                ))
            }
            .topBar(
                centerView: { Text("It's Title") }
            )
            .ignoresSafeArea(edges: .bottom)
            .toast(config: viewStore.binding(
                get: \.toast,
                send: RootCoordinator.Action.onToast
            ))
        }
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

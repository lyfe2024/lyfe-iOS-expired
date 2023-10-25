import SwiftUI
import ComposableArchitecture
import DesignSystem

struct ProfileView: View {
    let store: StoreOf<ProfileCore>
    
    init(store: StoreOf<ProfileCore>) {
        self.store = store
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button {
                self.store.send(.pushProfileEdit)
            } label: {
                Text("Push ProfileEdit")
            }
        }
        .topBar(centerView: { Text("Profile") })
        .background(Color.white)
        .ignoresSafeArea(edges: .bottom)
    }
}
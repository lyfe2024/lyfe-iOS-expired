import SwiftUI
import ComposableArchitecture
import DesignSystem

struct ProfileEditView: View {
    let store: StoreOf<ProfileEditCore>
    
    init(store: StoreOf<ProfileEditCore>) {
        self.store = store
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            HStack {
                Text("프로필 수정")
                    .font(.system(size: 24, weight: .bold))
                
                Spacer()
            }
            
            LyfePhotosPicker()
            
            HStack(spacing: 8) {
                TextField("placeholder", text: .init(
                    get: { self.store.withState(\.nickname) },
                    set: { self.store.send(.binding(.set(\.$nickname, $0))) }
                ))
                
                Button {
                    self.store.send(.binding(.set(\.$nickname, "")))
                } label: {
                    DesignSystemAsset.cancelMark.swiftUIImage
                        .resizable()
                        .frame(width: 32, height: 32)
                }
            }
            .padding(.leading, 12)
            .padding(.trailing, 8)
            .padding(.vertical, 8)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .inset(by: 0.5)
                    .stroke(Color(red: 0.21, green: 0.21, blue: 0.21), lineWidth: 1)
            )
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .topBar(
            leftView: {  
                Button {
                    self.store.send(.dismiss)
                } label: {
                    DesignSystemAsset.arrowBack.swiftUIImage
                }
            }
        )
        .background(Color.white)
        .ignoresSafeArea(edges: .bottom)
    }
}

import SwiftUI
import ComposableArchitecture
import DesignSystem

struct ProfileEditView: View {
    let store: StoreOf<ProfileEditCore>
    
    init(store: StoreOf<ProfileEditCore>) {
        self.store = store
    }
    
    @State var profileImage: Image?
    @State var profileImageData: Data?
    
    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            HStack {
                Text("프로필 수정")
                    .font(.system(size: 24, weight: .bold))
                
                Spacer()
            }
            
            LyfePhotosPicker(
                image: self.$profileImage,
                imageData: .init(
                    get: { self.store.withState(\.profileImageData) },
                    set: { self.store.send(.loadProfileImageData($0)) }
                ),
                view: {
                    VStack {
                        if let profileImage {
                            profileImage
                                .resizable()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                        } else {
                            DesignSystemAsset.CommonAssets.avatar.swiftUIImage
                        }
                    }
                }
            )
            
            HStack(spacing: 8) {
                TextField("placeholder", text: .init(
                    get: { self.store.withState(\.nickname) },
                    set: { self.store.send(.binding(.set(\.$nickname, $0))) }
                ))
                
                Button {
                    self.store.send(.binding(.set(\.$nickname, "")))
                } label: {
                    DesignSystemAsset.CommonAssets.cancelMark.swiftUIImage
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
            
            Button {
                
            } label: {
                Text("완료")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(
                        self.store.withState(\.isEnabledDoneButton)
                        ? Color.white
                        : DesignSystemAsset.Color.gray003.swiftUIColor
                    )
                    .frame(height: 24)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
            }
            .frame(maxWidth: .infinity)
            .background(
                self.store.withState(\.isEnabledDoneButton)
                ? Color.black
                : DesignSystemAsset.Color.gray001.swiftUIColor
            )
            .cornerRadius(10)
            .padding(.bottom, 40)
        }
        .padding(.horizontal, 20)
        .topBar(
            leftView: {  
                Button {
                    self.store.send(.dismiss)
                } label: {
                    DesignSystemAsset.CommonAssets.arrowBack.swiftUIImage
                }
            }
        )
        .background(Color.white)
        .ignoresSafeArea(edges: .bottom)
    }
}

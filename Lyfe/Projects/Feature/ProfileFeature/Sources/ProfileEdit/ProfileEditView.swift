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
    
    @FocusState var focusState: FocusField?
    
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
                    ZStack {
                        if let profileImage {
                            profileImage
                                .resizable()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                        } else {
                            R.Common.avatar
                        }
                    }
                    .padding(8)
                    .overlay(alignment: .bottomTrailing) {
                        R.Common.addCircleFill
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(R.Color.mainPrimary500)
                            .frame(width: 24, height: 24)
                    }
                }
            )
            
            NicknameSection(
                text: .init(
                    get: { self.store.withState(\.nickname) },
                    set: { self.store.send(.binding(.set(\.$nickname, $0))) }
                ),
                placeholder: "닉네임을 입력해주세요.",
                focusState: self._focusState,
                validList: self.store.withState(\.validInfos)
            )
            
            Spacer()
            
            
            DefaultButton(
                text: "완료",
                isEnabled: self.store.withState(\.isEnabledDoneButton),
                tapAction: { }
            )
            .padding(.bottom, 40)
        }
        .padding(.horizontal, 20)
        .topBar(
            leftView: {  
                Button {
                    self.store.send(.dismiss)
                } label: {
                    R.Common.arrowBack
                }
            }
        )
        .background(Color.white)
        .ignoresSafeArea(edges: .bottom)
        .task {
            self.store.send(.onAppear)
        }
    }
}

extension ProfileEditView {
    
    struct NicknameSection: View {
        @Binding var text: String
        var placeholder: String
        @FocusState var focusState: FocusField?
        
        var validList: [ValidInfo]
        
        var body: some View {
            VStack(spacing: 8) {
                DefaultTextField(
                    text: self.$text,
                    placeholder: self.placeholder,
                    focusState: self._focusState
                )
                
                ValidationView(list: self.validList)
            }
        }
    }
}

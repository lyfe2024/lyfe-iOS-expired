import SwiftUI
import ComposableArchitecture
import DesignSystem

struct NicknameView: View {
    let store: StoreOf<NicknameCore>

    @FocusState var focusState: FocusField?
    
    init(store: StoreOf<NicknameCore>) {
        self.store = store
    }
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("닉네임 설정")
                        .font(.system(size: 24, weight: .bold))

                    Text("원하는 닉네임을 설정해주세요.")
                        .font(.system(size: 14, weight: .bold))
                }
                Spacer()
            }
            
            
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
            
            Button {
                
            } label: {
                Text("완료")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(
                        self.store.withState(\.isEnabledDoneButton)
                        ? Color.white
                        : R.Color.grey300
                    )
                    .frame(height: 24)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
            }
            .frame(maxWidth: .infinity)
            .background(
                self.store.withState(\.isEnabledDoneButton)
                ? R.Color.mainOrange500
                : R.Color.grey100
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


extension NicknameView {
    
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

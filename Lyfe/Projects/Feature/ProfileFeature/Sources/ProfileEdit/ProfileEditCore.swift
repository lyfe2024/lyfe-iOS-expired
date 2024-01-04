import ComposableArchitecture
import DesignSystem
import CoreKit
import Foundation
import UserDomain
import UserDomainInterface
import BaseDomain
import BaseDomainInterface

public struct ProfileEditCore: Reducer {
    public init() {}
    
    @Dependency(\.validator) var validator
    @Dependency(\.userClient) var userAPI
    @Dependency(\.commonClient) var commonAPI
    
    public struct State: Equatable {
        let id: UUID = .init()
        
        public init() {}
        
        @BindingState var nickname: String = ""
        var isEnabledDoneButton: Bool = false
        var profileImageData: Data?
        var validInfos: [ValidInfo] = []
    }
    
    public enum Action: BindableAction {
        case onAppear
        case dismiss
        
        case loadProfileImageData(Data?)
        
        case doneButtonTap
        
        case patchUserInfoResponse(TaskResult<UsersDTO.Me.Response>)
        
        case binding(BindingAction<State>)
    }
    
    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce<State, Action> { state, action in
            switch action {
            case .onAppear:
                state.validInfos = self.makeInitValidInfos()
                return .none
            case .dismiss:
                // handle by Coordinator
                return .none
                
            case .loadProfileImageData(let data):
                state.profileImageData = data
                return .none
                
            case .doneButtonTap:
                return .run { [nickname = state.nickname] send in
                    let uploadImage = try await self.commonAPI.uploadImage(.init(format: "", path: "", image: Data()))
                    
                    if let imageURL = uploadImage.result.first?.url {
                        let updateMe = try await self.userAPI.updateMe(nickname, imageURL)
                        await send(.patchUserInfoResponse(
                            await TaskResult { updateMe }
                        ))
                    }
                    
                }
            case .patchUserInfoResponse(.success):
                return .none
            case .patchUserInfoResponse(.failure):
                return .none
                
            case .binding(\.$nickname):
                let isExistNickname = state.nickname.count > 0
                state.isEnabledDoneButton = isExistNickname
                
                state.validInfos = self.updateValidInfos(text: state.nickname, state.validInfos)
                
                return .none
            case .binding:
                // Binding
                return .none
            }
        }
    }
}

extension ProfileEditCore {
    private func makeInitValidInfos() -> [ValidInfo] {
        return [
            .init(status: .default, text: "한글/영문+숫자 조합"),
            .init(status: .default, text: "특수문자 사용 X"),
            .init(status: .default, text: "최대 10글자"),
        ]
    }
    
    private func updateValidInfos(text: String, _ infos: [ValidInfo]) -> [ValidInfo] {
        var _infos = infos
        
        if text.count > 0 {
            _infos[0].status = self.isValidCharacter(text) ? .success : .failure
            _infos[1].status = self.validator.isValidSpecial(text) ? .failure : .success
            _infos[2].status = text.count < 11 ? .success : .failure
        } else {
            _infos.indices.forEach { _infos[$0].status = .default }
        }
        
        return _infos
    }
    
    private func isValidCharacter(_ text: String) -> Bool {
        let isValidKorean = self.validator.isValidKorean(text)
        let isValidAlphabet = self.validator.isValidAlphabet(text)
        let isValidNumeric = self.validator.isValidNumeric(text)
        
        return isValidKorean || (isValidAlphabet && isValidNumeric)
    }
}

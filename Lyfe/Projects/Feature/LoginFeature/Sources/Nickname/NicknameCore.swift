import ComposableArchitecture
import DesignSystem
import CoreKit
import Foundation

public struct NicknameCore: Reducer {
    public init() {}
    
    @Dependency(\.validator) var validator
    
    public struct State: Equatable {
        public let id: UUID = .init()
        
        public init() {}
        
        @BindingState public var nickname: String = ""
        var isEnabledDoneButton: Bool = false
        var validInfos: [ValidInfo] = [
            .init(status: .default, text: "한글/영문+숫자 조합"),
            .init(status: .default, text: "특수문자 사용 X"),
            .init(status: .default, text: "최대 10글자"),
        ]
    }
    
    public enum Action: BindableAction, Equatable {
        case onAppear
        case dismiss
        case binding(BindingAction<State>)
    }
    
    
    
    public var body: some Reducer<State, Action> {
        BindingReducer()
            
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .none
            case .dismiss:
                return .none
            case .binding(\.$nickname):
                let isExistNickname = state.nickname.count > 0
                state.isEnabledDoneButton = isExistNickname
                
                state.validInfos = self.updateValidInfos(text: state.nickname, state.validInfos)
                return .none
            case .binding:
                return .none
            }
        }
    }
    
    
}


extension NicknameCore {
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

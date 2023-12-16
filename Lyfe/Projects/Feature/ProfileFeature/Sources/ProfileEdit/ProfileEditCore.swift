import ComposableArchitecture
import DesignSystem
import Foundation

public struct ProfileEditCore: Reducer {
    public init() {}
    
    public struct State: Equatable {
        let id: UUID = .init()
        
        public init() {}
        
        @BindingState var nickname: String = ""
        var isEnabledDoneButton: Bool = false
        var profileImageData: Data?
        var validInfos: [ValidInfo] = []
    }
    
    public enum Action: Equatable, BindableAction {
        case onAppear
        case dismiss
        
        case loadProfileImageData(Data?)
        
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
            _infos[1].status = self.isValidSpecial(text) ? .failure : .success
            _infos[2].status = text.count < 11 ? .success : .failure
        } else {
            _infos.indices.forEach { _infos[$0].status = .default }
        }
        
        return _infos
    }
    
    private func isValidCharacter(_ text: String) -> Bool {
        
        let regExKorean = ".*[가-힣ㄱ-ㅎㅏ-ㅣ].*"
        let isValidKorean = text.range(of: regExKorean, options: .regularExpression) != nil
        
        let regExAlphabet = ".*[a-zA-Z].*"
        let isValidAlphabet = text.range(of: regExAlphabet, options: .regularExpression) != nil
        
        let regExNumeric = ".*[0-9].*"
        let isValidNumeric = text.range(of: regExNumeric, options: .regularExpression) != nil
        
        return isValidKorean || (isValidAlphabet && isValidNumeric)
    }
    
    private func isValidSpecial(_ text: String) -> Bool {
        let regExSpecial = ".*[+×÷=_/[/]!@#₩$^&()\\-:;,?`~\\\\|{}.․‘“].*"
        let isValidSpecial = text.range(of: regExSpecial, options: .regularExpression) != nil
        return isValidSpecial
    }
}

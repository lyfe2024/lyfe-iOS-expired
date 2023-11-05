import XCTest
import LoginFeature
import ComposableArchitecture

final class LoginFeatureTests: XCTestCase {
    let store = TestStore(initialState: NicknameCore.State()) {
        NicknameCore()
    }
    
    func test닉네임병경시_ClearButton_활성화() async {
        await self.store.send(.binding(.set(\.$nickname, "1"))) {
            $0.nickname = "1"
            $0.isEnableThird = true
            
            print("nickname : " + $0.nickname)
            print("isEnableThird : " + $0.isEnableThird.description)
        }
    }
}


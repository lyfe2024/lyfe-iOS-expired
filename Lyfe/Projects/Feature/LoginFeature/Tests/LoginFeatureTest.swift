import XCTest
import LoginFeature
import ComposableArchitecture

final class LoginFeatureTests: XCTestCase {
    let store = TestStore(initialState: NicknameCore.State()) {
        NicknameCore()
    }
    
    func test닉네임병경시_ClearButton_활성화() async {
        await self.store.send(.binding(.set(\.$name, "1"))) {
            $0.name = "1"
            $0.isInput = true
            $0.isEnableFirst = true
            $0.isEnableSecond = true
            $0.isEnableThird = true
            $0.isEnableDoneButton = true
            
            print("nickname : " + $0.name)
            print("isEnableThird : " + $0.isEnableThird.description)
        }
    }
}



import ComposableArchitecture
import ProfileFeature
import XCTest

@MainActor
final class ProfileEditCoreTests: XCTestCase {
    let store = TestStore(
        initialState: ProfileEditCore.State()
    ) {
        ProfileEditCore()
    }
    
    func test닉네임변경_시_DoneButton_활성화() async {
        await self.store.send(.binding(.set(\.$nickname, "1"))) {
            $0.nickname = "1"
            $0.isEnabledDoneButton = true
        }
    }
}

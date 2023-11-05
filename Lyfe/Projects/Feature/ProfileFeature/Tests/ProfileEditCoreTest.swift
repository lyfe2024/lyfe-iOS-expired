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
    
    func test이미지데이터불러오기_성공() async {
        let imageData = Data()
        await self.store.send(.loadProfileImageData(imageData)) {
            $0.profileImageData = imageData
        }
        
        await self.store.send(.loadProfileImageData(nil)) {
            $0.profileImageData = nil
        }
    }
}

import UIKit
import SwiftUI
import ProfileFeature

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let splashView = ProfileCoordinatorView(
            store: .init(
                initialState: ProfileCoordinator.State.init()
            ) {
                ProfileCoordinator()
            }
        )
        window?.rootViewController = UIHostingController(rootView: splashView)
        window?.makeKeyAndVisible()
        
        
        return true
    }
}

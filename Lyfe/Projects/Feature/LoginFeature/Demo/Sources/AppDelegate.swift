import UIKit
import SwiftUI
import LoginFeature

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let splashView = LoginCoordinatorView(
            store: .init(
                initialState: LoginCoordinator.State.init()
            ) {
                LoginCoordinator()
            }
        )
        window?.rootViewController = UIHostingController(rootView: splashView)
        window?.makeKeyAndVisible()
        
        
        return true
    }
}

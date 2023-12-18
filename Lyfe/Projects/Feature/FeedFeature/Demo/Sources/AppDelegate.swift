import UIKit
import FeedFeatureInterface
import SwiftUI
import FeedFeature

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let splashView = FeedCoordinatorView(
            store: .init(
                initialState: FeedCoordinator.State.init()
            ) {
                FeedCoordinator()
            }
        )
        window?.rootViewController = UIHostingController(rootView: splashView)
        window?.makeKeyAndVisible()
        
        
        return true
    }
}

import ProjectDescription
import ConfigurationPlugin

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .remote(url: "https://github.com/onevcat/Kingfisher.git", requirement: .exact("7.9.1")),
            .remote(url: "https://github.com/johnpatrickmorgan/TCACoordinators", requirement: .exact("0.6.0")),
            .remote(url: "https://github.com/pointfreeco/swift-composable-architecture", requirement: .exact("1.2.0")),
            .remote(url: "https://github.com/Swinject/Swinject.git", requirement: .exact("2.8.3")),
    
        ],
        baseSettings: .settings(
            configurations: [
                .debug(name: .dev),
                .debug(name: .stage),
                .release(name: .prod)
            ]
        )
    ),
    platforms: [.iOS]
)

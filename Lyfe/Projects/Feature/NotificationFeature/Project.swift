import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.NotificationFeature.rawValue,
    targets: [
        .interface(module: .feature(.NotificationFeature)),
        .implements(module: .feature(.NotificationFeature), dependencies: [
            .feature(target: .NotificationFeature, type: .interface)
        ]),
        .testing(module: .feature(.NotificationFeature), dependencies: [
            .feature(target: .NotificationFeature, type: .interface)
        ]),
        .tests(module: .feature(.NotificationFeature), dependencies: [
            .feature(target: .NotificationFeature)
        ]),
        .demo(module: .feature(.NotificationFeature), dependencies: [
            .feature(target: .NotificationFeature)
        ])
    ]
)

import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.LoginFeature.rawValue,
    targets: [
        .interface(module: .feature(.LoginFeature), dependencies: [
            .feature(target: .BaseFeature, type: .interface)
        ]),
        .implements(module: .feature(.LoginFeature), dependencies: [
            .feature(target: .BaseFeature),
            .feature(target: .LoginFeature, type: .interface)
        ]),
        .testing(module: .feature(.LoginFeature), dependencies: [
            .feature(target: .LoginFeature, type: .interface)
        ]),
        .tests(module: .feature(.LoginFeature), dependencies: [
            .feature(target: .LoginFeature)
        ]),
        .demo(module: .feature(.LoginFeature), dependencies: [
            .feature(target: .LoginFeature)
        ])
    ]
)

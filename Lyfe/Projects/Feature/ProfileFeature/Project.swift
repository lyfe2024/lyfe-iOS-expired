import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.ProfileFeature.rawValue,
    targets: [
        .interface(module: .feature(.ProfileFeature)),
        .implements(module: .feature(.ProfileFeature), dependencies: [
            .feature(target: .BaseFeature),
            .feature(target: .ProfileFeature, type: .interface)
        ]),
        .testing(module: .feature(.ProfileFeature), dependencies: [
            .feature(target: .ProfileFeature, type: .interface)
        ]),
        .tests(module: .feature(.ProfileFeature), dependencies: [
            .feature(target: .ProfileFeature)
        ]),
        .demo(module: .feature(.ProfileFeature), dependencies: [
            .feature(target: .ProfileFeature)
        ])
    ]
)

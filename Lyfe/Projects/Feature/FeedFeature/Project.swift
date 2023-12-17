import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.FeedFeature.rawValue,
    targets: [
        .interface(module: .feature(.FeedFeature)),
        .implements(module: .feature(.FeedFeature), dependencies: [
            .feature(target: .FeedFeature, type: .interface)
        ]),
        .testing(module: .feature(.FeedFeature), dependencies: [
            .feature(target: .FeedFeature, type: .interface)
        ]),
        .tests(module: .feature(.FeedFeature), dependencies: [
            .feature(target: .FeedFeature)
        ]),
        .demo(module: .feature(.FeedFeature), dependencies: [
            .feature(target: .FeedFeature)
        ])
    ]
)

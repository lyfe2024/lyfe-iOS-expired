import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.BaseFeature.rawValue,
    targets: [
        .interface(module: .feature(.BaseFeature), dependencies: [
            .SPM.TCACoordinators
        ]),
        .implements(module: .feature(.BaseFeature), dependencies: [
            .feature(target: .BaseFeature, type: .interface),
            .userInterface(target: .DesignSystem),
            .shared(target: .GlobalThirdPartyLibrary),
        ]),
        .tests(module: .feature(.BaseFeature), dependencies: [
            .feature(target: .BaseFeature)
        ])
    ]
)

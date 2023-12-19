import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.CommentDomain.rawValue,
    targets: [
        .interface(module: .domain(.CommentDomain), dependencies: [
            .domain(target: .BaseDomain, type: .interface)
        ]),
        .implements(module: .domain(.CommentDomain), dependencies: [
            .domain(target: .CommentDomain, type: .interface),
            .domain(target: .BaseDomain)
        ])
    ]
)

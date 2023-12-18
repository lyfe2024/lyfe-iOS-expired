import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.BoardDomain.rawValue,
    targets: [
        .interface(module: .domain(.BoardDomain), dependencies: [
            .domain(target: .BaseDomain, type: .interface)
        ]),
        .implements(module: .domain(.BoardDomain), dependencies: [
            .domain(target: .BoardDomain, type: .interface),
            .domain(target: .BaseDomain)
        ]),
        .testing(module: .domain(.BoardDomain), dependencies: [
            .domain(target: .BoardDomain, type: .interface)
        ]),
        .tests(module: .domain(.BoardDomain), dependencies: [
            .domain(target: .BoardDomain),
            .domain(target: .BoardDomain, type: .testing)
        ])
    ]
)

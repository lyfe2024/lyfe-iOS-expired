import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let Kingfisher = TargetDependency.external(name: "Kingfisher")
    static let TCACoordinators = TargetDependency.external(name: "TCACoordinators")
    static let ComposableArchitecture = TargetDependency.external(name: "ComposableArchitecture")
    static let Swinject = TargetDependency.external(name: "Swinject")
}

public extension Package {
}

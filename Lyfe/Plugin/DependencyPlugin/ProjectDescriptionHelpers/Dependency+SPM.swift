import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let ComposableArchitecture = TargetDependency.external(name: "ComposableArchitecture")
    static let Swinject = TargetDependency.external(name: "Swinject")
}

public extension Package {
}

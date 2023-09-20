import Foundation
import ProjectDescription

public struct ProjectEnvironment {
    public let name: String
    public let organizationName: String
    public let deploymentTarget: DeploymentTarget
    public let platform: Platform
    public let baseSetting: SettingsDictionary
}

public let env = ProjectEnvironment(
    name: "Lyfe",
    organizationName: "com.lyfe.lyfe",
    deploymentTarget: .iOS(targetVersion: "17.0", devices: [.iphone]),
    platform: .iOS,
    baseSetting: [:]
)
// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ToyRobotPackage",
    platforms: [
        // Add support for all platforms starting from a specific version.
        .macOS(.v10_15),
    ],
    products: [
    ],
    targets: [
        .target(name: "ToyRobot", dependencies: [], path: "Source"),
        .testTarget(name: "ToyRobotTests", dependencies: ["ToyRobot"], path: "ToyRobotTests")
    ]
)

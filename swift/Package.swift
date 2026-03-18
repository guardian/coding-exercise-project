// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "coding_exercise_gu",
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "coding_exercise_gu",
        ),
        .testTarget(
            name: "coding_exercise_gu_tests",
            dependencies: ["coding_exercise_gu"],
        ),
    ]
)

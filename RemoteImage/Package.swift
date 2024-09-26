// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RemoteImage",

    platforms: [
        .macOS(.v15),
        .iOS(.v18)
    ],

    products: [
        .library(name: "RemoteImage", targets: ["RemoteImage"])
    ],

    targets: [
        .target(name: "RemoteImage"),
        .testTarget(
            name: "RemoteImageTests",
            dependencies: ["RemoteImage"]
        )
    ]
)

// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MoviesData",

    platforms: [
        .macOS(.v15),
        .iOS(.v18)
    ],

    products: [
        .library(name: "MoviesData", targets: ["MoviesData"])
    ],

    dependencies: [
        .package(path: "../MoviesDomain"),
        .package(path: "../CachingStore"),
        .package(url: "https://github.com/adamayoung/TMDb.git", from: "13.1.0")
    ],

    targets: [
        .target(
            name: "MoviesData",
            dependencies: ["MoviesDomain", "TMDb", "CachingStore"]
        ),
        .testTarget(
            name: "MoviesDataTests",
            dependencies: ["MoviesData"]
        )
    ]
)

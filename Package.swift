// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StocksApi",
    platforms: [
        .iOS(.v13),
        .macOS(.v12),
        .tvOS(.v13)
    ],
    products: [
        .library(
            name: "StocksApi",
            targets: ["StocksApi"]),
        .executable(name: "StocksAPIExec", targets: ["StocksAPIExec"]),
    ],
    targets: [
        .target(
            name: "StocksApi",
            dependencies: []),
        .executableTarget(name: "StocksAPIExec", dependencies: ["StocksApi"])
    ]
)

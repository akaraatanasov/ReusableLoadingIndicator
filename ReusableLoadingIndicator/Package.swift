// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ReusableLoadingIndicator",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "ReusableLoadingIndicator",
            targets: ["ReusableLoadingIndicator"]),
    ],
    targets: [
        .target(
            name: "ReusableLoadingIndicator",
            dependencies: []),
        .testTarget(
            name: "ReusableLoadingIndicatorTests",
            dependencies: ["ReusableLoadingIndicator"]),
    ]
)

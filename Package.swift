// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Realaml",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(
            name: "Realaml", targets: ["Realaml"]),
    ],
    targets: [
        .binaryTarget(
            name: "Realaml",
            path: "Realaml.xcframework"
        ),
    ]
)

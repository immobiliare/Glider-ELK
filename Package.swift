// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GliderELK",
    platforms: [
        .iOS(.v14), .macOS(.v11), .tvOS(.v14)
    ],
    products: [
        .library(name: "GliderELK", targets: ["GliderELK"])
    ],
    dependencies: [
        .package(url: "https://github.com/immobiliare/Glider.git", .upToNextMajor(from: "2.0.0")),
        .package(url: "https://github.com/swift-server/async-http-client.git", .upToNextMinor(from: "1.5.0"))
    ],
    targets: [
        .target(
            name: "GliderELK",
            dependencies: [
                "Glider",
                .product(name: "AsyncHTTPClient", package: "async-http-client")
            ],
            path:"GliderELK/Sources"
        ),
        .testTarget(
            name: "GliderELKTests",
            dependencies: [
                "Glider",
                "GliderELK"
            ],
            path: "Tests/GliderELKTests"
        ),
    ]
)

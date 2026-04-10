// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WireGuardKit",
    platforms: [
        .macOS(.v13),
        .iOS(.v16)
    ],
    products: [
        .library(name: "WireGuardKit", targets: ["WireGuardKit"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "WireGuardKit",
            dependencies: ["WireGuardKitGo", "WireGuardKitC"],
            linkerSettings: [
                .linkedLibrary("wg-go")
            ]
        ),
        .target(
            name: "WireGuardKitC",
            dependencies: [],
            publicHeadersPath: "."
        ),
        .target(
            name: "WireGuardKitGo",
            dependencies: [],
            exclude: [
                "goruntime-boottime-over-monotonic.diff",
                "go.mod",
                "go.sum",
                "api-apple.go",
                "Makefile",
                "libwg-go.a"
            ],
            publicHeadersPath: ".",
            linkerSettings: [
                .unsafeFlags(["-L", "Sources/WireGuardKitGo"]),
                .linkedLibrary("wg-go")
            ]
        )
    ]
)

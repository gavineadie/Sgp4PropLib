// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Sgp4PropLib",
    platforms: [.macOS(.v10_13)],
    products: [
        .library(name: "Sgp4PropLib", targets: ["Sgp4PropLib",
                                                "AstroStds_c"]),
    ],
    dependencies: [ ],
    targets: [
        .target(name: "Sgp4PropLib", dependencies: [ "AstroStds_c" ]),
        .target(name: "AstroStds_c", dependencies: [ ]),
        .testTarget(name: "Sgp4PropLibTests", dependencies: ["Sgp4PropLib"]),
    ]
)

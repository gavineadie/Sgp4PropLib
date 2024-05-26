// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "Sgp4PropLib",
    platforms: [.macOS(.v10_13)],
    products: [
        .library(name: "Sgp4PropLib", targets: ["Sgp4PropLib"]),
    ],
    dependencies: [ ],
    targets: [
        .target(name: "Sgp4PropLib", dependencies: [ ]),
        .testTarget(name: "Sgp4PropLibTests", dependencies: ["Sgp4PropLib"]),
    ]
)

// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Sgp4PropLib",
    platforms: [.macOS(.v10_13)],
    products: [
        .library(name: "Sgp4PropLib", targets: ["Sgp4PropLib", "Sgp4Prop_c"]),
    ],
    dependencies: [ ],
    targets: [
        .target(name: "Sgp4PropLib", dependencies: [ "Sgp4Prop_c" ]),
        .target(name: "Sgp4Prop_c", dependencies: [ ]),
        .testTarget(name: "Sgp4PropLibTests", dependencies: ["Sgp4PropLib"]),
    ]
)

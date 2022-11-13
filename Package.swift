// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Sgp4PropLib",
    products: [
        .library(name: "Sgp4PropLib", targets: ["swift", "obj_c"]),
    ],
    dependencies: [ ],
    targets: [
        .target(name: "swift", dependencies: [ "obj_c" ]),
        .target(name: "obj_c", dependencies: [ ]),
    ]
)

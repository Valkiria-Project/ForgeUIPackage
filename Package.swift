// swift-tools-version: 5.7.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ForgeUIPackage",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ForgeUIPackage",
            targets: ["ForgeUIPackage"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ForgeUIPackage",
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "ForgeUIPackageTests",
            dependencies: ["ForgeUIPackage"]
        ),
        .binaryTarget(
            name: "ForgeUIPackageBinary",
            url: "https://github.com/Valkiria-Project/ForgeUIPackage/releases/download/36%2Fmerge/ForgeUIPackage.zip",
            checksum: "521ccdb391cfa6c1e697b8e139268982c59a8e12013b2fa83f291d227f58a439"
        )
    ]
)

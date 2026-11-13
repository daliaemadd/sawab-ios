// swift-tools-version: 6.0
import PackageDescription

// A lightweight host-side test harness for the app's Foundation models.
let package = Package(
    name: "SawabModels",
    platforms: [.macOS(.v14)],
    targets: [
        .target(name: "SawabModels", path: "Sawab/Models"),
        .testTarget(name: "SawabModelTests", dependencies: ["SawabModels"], path: "Tests/SawabModelTests")
    ]
)

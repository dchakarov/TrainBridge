// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "TrainBridge",
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
				.package(url: "https://github.com/dchakarov/TrainInformationService.git", from: "0.1.0"),
    ],
    targets: [
        .target(name: "App", dependencies: ["TrainInformationService", "Vapor"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)


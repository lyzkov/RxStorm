// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "RxStorm",
    platforms: [
        .iOS(.v10),
    ],
    products: [
        .library(
            name: "RxStorm",
            targets: ["RxStorm"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "5.0.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "4.8.0"),
        .package(url: "https://github.com/RxSwiftCommunity/RxAlamofire.git", from: "5.0.0"),
        // Tests
        .package(url: "https://github.com/Quick/Quick.git", from: "2.0.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "8.0.0"),
    ],
    targets: [
        .target(
            name: "RxStorm",
            dependencies: ["RxSwift", "Alamofire", "RxAlamofire"]),
        .testTarget(
            name: "RxStormTests",
            dependencies: ["RxStorm", "Quick", "Nimble"], exclude: ["RxStormExample/"]),
    ],
    swiftLanguageVersions: [.v4, .v4_2, .v5]
)

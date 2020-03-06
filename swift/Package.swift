// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GRPCExampleServer",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    .package(url: "https://github.com/grpc/grpc-swift.git", from: "1.0.0-alpha.9"),
    
    // GRPC dependencies:
    // Main SwiftNIO package
    .package(url: "https://github.com/apple/swift-nio.git", from: "2.11.0"),
    // HTTP2 via SwiftNIO
    .package(url: "https://github.com/apple/swift-nio-http2.git", from: "1.8.0"),
    // TLS via SwiftNIO
    .package(url: "https://github.com/apple/swift-nio-ssl.git", from: "2.4.1"),
    // Support for Network.framework where possible.
    .package(url: "https://github.com/apple/swift-nio-transport-services.git", from: "1.3.0"),

    // Official SwiftProtobuf library, for [de]serializing data to send on the wire.
    .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.7.0"),


    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Server",
            dependencies: [
                "GRPC",
                "NIO",
                "Model",
            ],
            path: "Sources/Server"
        ),
        .target(
            name: "Client",
            dependencies: [
                "GRPC",
                "Model",
            ],
            path: "Sources/Client"
        ),
        .target(
            name: "Model",
            dependencies: [
                "GRPC",
                "NIO",
                "NIOHTTP1",
                "SwiftProtobuf"
            ],
            path: "Sources/Model"
        ),
        // .testTarget(
        //     name: "serverTests",
        //     dependencies: ["Server"]),
    ]
)

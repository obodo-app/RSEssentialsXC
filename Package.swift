// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
 
let package = Package(
   name: "RSEssentials",
   platforms: [.iOS(.v10)],
   products: [
       .library(
           name: "RSEssentials",
           targets: ["RSEssentialsTarget"]),
   ],
   dependencies: [
        .package(name: "PKHUD", url: "https://github.com/pkluz/PKHUD", .upToNextMajor(from: "5.4.0")),
        .package(name: "DeviceKit", url: "https://github.com/devicekit/DeviceKit", .upToNextMajor(from: "4.4.0")),
   ],
   targets: [
       .target(
            name: "RSEssentialsTarget",
            dependencies: [.target(name: "RSEssentialsWrapper"), .target(name: "RSEssentialsDesignables")],
            path: "RSEssentialsWrap"),
       .target(
            name: "RSEssentialsWrapper",
            dependencies: ["RSEssentials", "PKHUD", "DeviceKit"],
            path: "RSEssentialsWrapper"),
		.target(
			name: "RSEssentialsDesignables",
			dependencies: ["RSEssentials",],
			path: "Files"),
       .binaryTarget(
           name: "RSEssentials",
           url: "https://github.com/rursache/RSEssentialsXC/raw/master/RSEssentials.xcframework.zip",
           checksum: "d2351a5d923b9224d9d1784e77c63a48adf63942427652a5c70a75597261c405")
   ],
   swiftLanguageVersions: [.v5]
)

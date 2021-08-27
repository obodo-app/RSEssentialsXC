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
            dependencies: [.target(name: "RSEssentialsWrapper")],
            path: "RSEssentialsWrap"),
       .target(
            name: "RSEssentialsWrapper",
            dependencies: ["RSEssentials", "PKHUD", "DeviceKit"],
            path: "RSEssentialsWrapper"),
       .binaryTarget(
           name: "RSEssentials",
           url: "https://github.com/rursache/RSEssentialsXC/raw/master/RSEssentials.xcframework.zip",
           checksum: "4cb79a11d8044f58e295aec7019a2217dd921d47d786f87cf917d0a7ded9b104")
   ],
   swiftLanguageVersions: [.v5]
)

// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
 
let package = Package(
   name: "RSEssentials",
   products: [
       .library(
           name: "RSEssentials",
           targets: ["RSEssentials"]),
   ],
   dependencies: [
        .package(name: "PKHUD", url: "https://github.com/pkluz/PKHUD", .upToNextMajor(from: "5.4.0")),
        .package(name: "DeviceKit", url: "https://github.com/devicekit/DeviceKit", .upToNextMajor(from: "4.4.0")),
   ],
   targets: [
       .binaryTarget(
           name: "RSEssentials",
           dependencies: ["PKHUD", "DeviceKit"],
           url: "https://github.com/rursache/RSEssentialsXC/raw/master/RSEssentials.xcframework.zip",
           checksum: "9dede4fc4dd075bc49f93e8d99b980c53c9440fc2b1d286c126f26826aab798f")
   ],
   swiftLanguageVersions: [.v5]
)
// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
 
let package = Package(
   name: "RSEssentialsXC",
   products: [
       .library(
           name: "RSEssentialsXC",
           targets: ["RSEssentials"]),
   ],
   targets: [
       .binaryTarget(
           name: "RSEssentials",
           url: "RSEssentials.xcframework.zip",
           checksum: "60833fb5ccd9e6efa49a9fdde11e3269685831d8c4ecb494aa05d70437c384d9")
   ],
   swiftLanguageVersions: [.v5]
)
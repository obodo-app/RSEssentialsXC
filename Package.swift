// swift-tools-version:5.5
import PackageDescription
 
let package = Package(
   name: "RSEssentials",
   platforms: [.iOS(.v10)],
   products: [
       .library(
           name: "RSEssentials",
           targets: ["RSEssentials+Designables"])
   ],
   targets: [
       .target(
			name: "RSEssentials+Designables",
			dependencies: ["RSEssentials"],
			path: "Files"),
       .binaryTarget(
           name: "RSEssentials",
           url: "https://github.com/rursache/RSEssentialsXC/raw/master/RSEssentials.xcframework.zip",
           checksum: "5427a17b9f5337feaf13ed025b6ae6f7e9014a6b9940af4e31a060ee5e235436")
   ],
   swiftLanguageVersions: [.v5]
)

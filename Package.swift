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
   targets: [
       .binaryTarget(
           name: "RSEssentials",
           url: "https://github.com/rursache/RSEssentialsXC/raw/master/RSEssentials.xcframework.zip",
           checksum: "c7722754a826021f7b40537eb86070ca6973419704c4decb5eb144ca983259c1")
   ],
   swiftLanguageVersions: [.v5]
)
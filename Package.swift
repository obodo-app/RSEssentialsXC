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
   dependencies: [
        .package(name: "PKHUD", url: "https://github.com/pkluz/PKHUD", .upToNextMajor(from: "5.4.0")),
        .package(name: "DeviceKit", url: "https://github.com/devicekit/DeviceKit", .upToNextMajor(from: "4.5.0"))
   ],
   targets: [
       .target(
			name: "RSEssentials+Designables",
			dependencies: ["RSEssentials", "PKHUD", "DeviceKit"],
			path: "Files"),
       .binaryTarget(
           name: "RSEssentials",
           url: "https://github.com/rursache/RSEssentialsXC/raw/master/RSEssentials.xcframework.zip",
           checksum: "0351eea65351ac75b0f97771b5a7ba1d2a4dc891ed0c100e3415252e100bd03b")
   ],
   swiftLanguageVersions: [.v5]
)

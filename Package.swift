// swift-tools-version:5.5
import PackageDescription
 
let package = Package(
   name: "RSEssentials",
   platforms: [.iOS(.v13)],
   products: [
       .library(
           name: "RSEssentials",
           targets: ["RSEssentialsTarget"]),
   ],
   targets: [
       .target(
            name: "RSEssentialsTarget",
            dependencies: [.target(name: "RSEssentialsWrapper")],
            path: "RSEssentialsWrap"),
       .target(
            name: "RSEssentialsWrapper",
            dependencies: ["RSEssentials", "RSEssentialsDesignables"],
            path: "RSEssentialsWrapper"),
		.target(
			name: "RSEssentialsDesignables",
			dependencies: ["RSEssentials"],
			path: "Files"),
       .binaryTarget(
           name: "RSEssentials",
           url: "https://github.com/rursache/RSEssentialsXC/raw/master/RSEssentials.xcframework.zip",
           checksum: "2224d1cab5408116f10473593e944282444ccfdbddd9a4b0c9d6e54baab1d6f0")
   ],
   swiftLanguageVersions: [.v5]
)

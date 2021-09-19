// swift-tools-version:5.5
import PackageDescription
 
let package = Package(
   name: "RSEssentials",
   platforms: [.iOS(.v10)],
   products: [
       .library(
           name: "RSEssentials",
           targets: ["RSEssentialsTarget"])
   ],
   dependencies: [
        .package(name: "PKHUD", url: "https://github.com/pkluz/PKHUD", .upToNextMajor(from: "5.4.0")),
        .package(name: "DeviceKit", url: "https://github.com/devicekit/DeviceKit", .upToNextMajor(from: "4.5.0"))
   ],
   targets: [
       .target(
            name: "RSEssentialsTarget",
            dependencies: [
                .target(name: "RSEssentialsWrapper", condition: .when(platforms: [.iOS, .macCatalyst]))
            ],
            path: "RSEssentialsWrap"),
       .target(
            name: "RSEssentialsWrapper",
            dependencies: [
                .byName(name: "PKHUD", condition: .when(platforms: [.iOS, .macCatalyst])),
                .byName(name: "DeviceKit", condition: .when(platforms: [.iOS, .macCatalyst]))
            ],
            path: "RSEssentialsWrapper"),
		.target(
			name: "RSEssentialsDesignables",
			dependencies: [
                .byName(name: "RSEssentials", condition: .when(platforms: [.iOS, .macCatalyst])),
                .byName(name: "PKHUD", condition: .when(platforms: [.iOS, .macCatalyst])),
                .byName(name: "DeviceKit", condition: .when(platforms: [.iOS, .macCatalyst]))
            ],
			path: "Files"),
       .binaryTarget(
           name: "RSEssentials",
           url: "https://github.com/rursache/RSEssentialsXC/raw/master/RSEssentials.xcframework.zip",
           checksum: "b9a8115f4085afa5304dba3bf47a75b6262f2a809db4f484ad3a1eda9671885b")
   ],
   swiftLanguageVersions: [.v5]
)

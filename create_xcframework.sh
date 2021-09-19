#!/bin/bash

# RanduSoft
#
# Source: https://forums.swift.org/t/how-to-build-swift-package-as-xcframework/41414/4
# Fixed with: https://forums.swift.org/t/how-to-build-swift-package-as-xcframework/41414/17
# Read more: https://github.com/bielikb/xcframeworks
#
# v2.0
#

set -x
set -e

rm -rf *.xcarchive

xcodebuild -resolvePackageDependencies

xcodebuild archive -project 'RSEssentialsXC.xcodeproj' -scheme 'RSEssentialsXC' -configuration Release -destination 'generic/platform=iOS' -archivePath 'ios' SKIP_INSTALL=NO
xcodebuild archive -project 'RSEssentialsXC.xcodeproj' -scheme 'RSEssentialsXC' -configuration Release -destination 'generic/platform=iOS Simulator' -archivePath 'simulator' SKIP_INSTALL=NO
xcodebuild archive -project 'RSEssentialsXC.xcodeproj' -scheme 'RSEssentialsXC' -configuration Release -destination 'platform=macOS,arch=x86_64,variant=Mac Catalyst' -archivePath 'mac' SKIP_INSTALL=NO

xcodebuild -create-xcframework -framework 'ios.xcarchive/Products/Library/Frameworks/RSEssentials.framework' -framework 'simulator.xcarchive/Products/Library/Frameworks/RSEssentials.framework' -framework 'mac.xcarchive/Products/Library/Frameworks/RSEssentials.framework' -output 'RSEssentials.xcframework'

ditto -c -k --sequesterRsrc --keepParent RSEssentials.xcframework RSEssentials.xcframework.zip

rm -rf *.xcarchive
rm -rf RSEssentials.xcframework

swift package compute-checksum RSEssentials.xcframework.zip

say "Done"
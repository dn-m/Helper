//
//  TravisCI.swift
//  Helper
//
//  Created by James Bean on 12/25/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

/// Create a `.travis.yml` file for a given `projectName` in the given `directory`.
internal func createTravisYML(projectName: String, in directory: URL) throws {
    let contents = prepareTravisCIContents(projectName: projectName)
    try createFile(name: ".travis.yml", in: directory, contents: contents)
}

/// - returns: `String` contents of `.travis.yml` for a given `projectName`.
private func prepareTravisCIContents(projectName: String) -> String {
    var result = ""
    result.line("language: objective-c")
    result.line("osx_image: xcode8")
    result.line("env:")
    result.line("  matrix:")
    result.line("    - DESTINATION=\"platform=iOS Simulator,OS=9.3,name=iPad 2\"")
    result.line("      SCHEME=\"Collections\"")
    result.line("    - DESTINATION=\"platform=iOS Simulator,OS=10.0,name=iPad Pro (12.9 inch)\"")
    result.line("      SCHEME=\"\(projectName)\"")
    result.line("    - DESTINATION=\"platform=OS X\"")
    result.line("      SCHEME=\"\(projectName)Mac\"")
    result.line()
    result.line("before_script: if [ -f ./Cartresult ]; then carthage update; fi;")
    result.line()
    result.line("script: travis_retry xcodebuild test")
    result.line("  -project \(projectName).xcodeproj")
    result.line("  -scheme \"${SCHEME}\"")
    result.line("  -destination \"${DESTINATION}\"")
    result.line("  TOOLCHAINS=swift")
    result.line()
    result.line("after_success:")
    result.line("  - bash <(curl -s https://codecov.io/bash)")
    return result
}

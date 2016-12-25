//
//  GitIgnore.swift
//  Helper
//
//  Created by James Bean on 12/25/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

/// Create a `.gitignore` for a in the given `directory`.
internal func createGitIgnore(in directory: URL) throws {
    let contents = prepareGitIgnoreContents()
    try createFile(name: ".gitignore", in: directory, contents: contents)
}

/// - returns: `String` contents of `.gitignore`.
private func prepareGitIgnoreContents() -> String {
    var result = ""
    result.line("## Build generated")
    result.line("build/")
    result.line("DerivedData/")
    result.line()
    result.line("## Various settings")
    result.line("*.pbxuser")
    result.line("!default.pbxuser")
    result.line("*.mode1v3")
    result.line("!default.mode1v3")
    result.line("*.mode2v3")
    result.line("!default.mode2v3")
    result.line("*.perspectivev3")
    result.line("!default.perspectivev3")
    result.line("xcuserdata/")
    result.line()
    result.line("## Other")
    result.line("*.moved-aside")
    result.line("*.xcuserstate")
    result.line()
    result.line("## Obj-C/Swift specific")
    result.line("*.hmap")
    result.line("*.ipa")
    result.line("*.dSYM.zip")
    result.line("*.dSYM")
    result.line()
    result.line("# Carthage")
    result.line("Carthage/Checkouts")
    result.line("Carthage/Build")
    return result
}

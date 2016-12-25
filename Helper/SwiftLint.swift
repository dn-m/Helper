//
//  SwiftLint.swift
//  Helper
//
//  Created by James Bean on 12/25/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

/// Create a `.swiftlint.yml` file in a given `directory`.
internal func createSwiftLintYML(in directory: URL) throws {
    let contents = prepareSwiftLintYMLContents()
    try createFile(name: ".swiftlint.yml", in: directory, contents: contents)
}

/// - returns: `String` contents of a `swiftlint.yml`.
private func prepareSwiftLintYMLContents() -> String {
    var result = ""
    result.line("disabled_rules:")
    result.line("  - comma")
    result.line("  - variable_name")
    result.line()
    result.line("excluded:")
    result.line("  - Carthage")
    result.line()
    result.line("trailing_whitespace:")
    result.line("  ignores_empty_lines: true")
    return result
}

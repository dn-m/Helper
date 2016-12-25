//
//  HoundCI.swift
//  Helper
//
//  Created by James Bean on 12/25/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

/// Create a `.hound.yml` file in a given `directory`.
internal func createHoundYML(in directory: URL) throws {
    let contents = prepareHoundYMLContents()
    try createFile(name: ".hound.yml", in: directory, contents: contents)
}

/// - returns: `String` contents of a `hound.yml`.
private func prepareHoundYMLContents() -> String {
    var result = ""
    result.line("swift:")
    result.line("  config_file: .swiftlint.yml")
    return result
}

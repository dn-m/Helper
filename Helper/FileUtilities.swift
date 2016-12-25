//
//  FileUtilities.swift
//  Helper
//
//  Created by James Bean on 12/25/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

/// Create file with given `name` (with extension), in the given `directory`, with the given
/// `contents`.
///
/// - throws: Error if file cannot be created.
internal func createFile(name: String, in directory: URL, contents: String = "") throws {
    
    let fileManager = FileManager()
    let path = directory.appendingPathComponent(name).path
    
    // TODO: specialize error
    guard let data = contents.data(using: .utf8) else {
        throw Error.error
    }
    
    // TODO: specialize error
    if !fileManager.createFile(atPath: path, contents: data, attributes: nil) {
        throw Error.error
    }
}

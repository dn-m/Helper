//
//  Cartfile.swift
//  Helper
//
//  Created by James Bean on 12/25/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

/// Creates empty `Cartfile`.
internal func createCartfile(in directory: URL) throws {
    try createFile(name: "Cartfile", in: directory)
}

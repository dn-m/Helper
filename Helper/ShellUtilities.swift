//
//  ShellUtilities.swift
//  Helper
//
//  Created by James Bean on 12/26/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

@discardableResult
func shell(_ args: String...) -> Int32 {
    let task = Process()
    task.launchPath = "/usr/bin/env"
    task.arguments = args
    task.launch()
    task.waitUntilExit()
    return task.terminationStatus
}

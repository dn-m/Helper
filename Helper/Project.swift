//
//  Project.swift
//  Helper
//
//  Created by James Bean on 12/26/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

// Global reference to attributes of the current project
enum Project {
    
    // Name of project
    static var name: String {
        return FileManager.default.currentDirectoryPath.components(separatedBy: "/").last!
    }
    
    // Directory containing project
    static var directory: URL {
        return URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
    }
}

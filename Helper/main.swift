//
//  main.swift
//  Helper
//
//  Created by James Bean on 12/25/16.
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

let registry = CommandRegistry<CommandLineError>()

func prepareCommands() {
    registry.register(ConfigCommand())
    // TODO: InitCommand
    // TODO: UpdateCommand
}

func runCommands() {
    registry.main(defaultVerb: "update") { error in
        print("fuck")
        exit(1)
    }
}

prepareCommands()
runCommands()

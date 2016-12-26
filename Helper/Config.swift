//
//  Config.swift
//  Helper
//
//  Created by James Bean on 12/25/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

struct ConfigCommand: CommandProtocol {
    
    typealias Options = ConfigOptions
    
    var verb: String {
        return "config"
    }
    
    var function: String {
        return "Updates configuration: README.md, .travis.yml, .swiftlint.yml, .hound.yml, .gitignore.yml"
    }
    
    // FIXME: Implement
    func run(_ options: ConfigOptions) -> Result<(), CommandLineError> {
        print("Updating configuration")
        do {
            try configuration(projectName: project.name, directory: project.directory)
        } catch {
            print("Could not update config!")
        }
        
        return Result<(), CommandLineError>(value: ())
    }
}

// Empty
struct ConfigOptions: OptionsProtocol {
    
    typealias ClientError = CommandLineError
    
    static func evaluate(_ m: CommandMode)
        -> Result<ConfigOptions, CommandantError<CommandLineError>>
    {
        return Result<ConfigOptions, CommandantError<CommandLineError>>(value: ConfigOptions())
    }
}
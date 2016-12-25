//
//  Error.swift
//  Helper
//
//  Created by James Bean on 12/25/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

internal enum FileError: Error {
    
    case error
}

internal enum CommandError: Error {
    
    case error
}

struct LogCommand: CommandProtocol {
    typealias Options = LogOptions
    
    let verb = "log"
    let function = "Reads the log"
    
    func run(_ options: Options) -> Result<(), CommandError> {
        // Use the parsed options to do something interesting here.
        fatalError()
        //return ()
    }
}

struct LogOptions: OptionsProtocol {
    let lines: Int
    let verbose: Bool
    let logName: String
    
    static func create(_ lines: Int) -> (Bool) -> (String) -> LogOptions {
        return { verbose in { logName in LogOptions(lines: lines, verbose: verbose, logName: logName) } }
    }
    
    static func evaluate(_ m: CommandMode) -> Result<LogOptions, CommandantError<CommandError>> {
        return create
            <*> m <| Option(key: "lines", defaultValue: 0, usage: "the number of lines to read from the logs")
            <*> m <| Option(key: "verbose", defaultValue: false, usage: "show verbose output")
            <*> m <| Argument(usage: "the log to read")
    }
}

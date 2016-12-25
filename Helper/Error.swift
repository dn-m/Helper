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

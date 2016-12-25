//
//  UpdateCommand.swift
//  Helper
//
//  Created by James Bean on 12/25/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

struct UpdateCommand: CommandProtocol {
    
    typealias Options = UpdateOptions
    
    var verb: String {
        return "update"
    }
    
    var function: String {
        return "Update frameworks"
    }
    
    func run(_ options: UpdateOptions) -> Result<(), CommandLineError> {
        print("Update frameworks!")
        return Result<(), CommandLineError>(value: ())
    }
}

struct UpdateOptions: OptionsProtocol {
    
    typealias ClientError = CommandLineError
 
    // empty
    public static func evaluate(_ m: CommandMode)
        -> Result<UpdateOptions, CommandantError<CommandLineError>>
    {
        return Result<UpdateOptions, CommandantError<CommandLineError>>(value: UpdateOptions())
    }
}

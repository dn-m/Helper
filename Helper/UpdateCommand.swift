//
//  UpdateCommand.swift
//  Helper
//
//  Created by James Bean on 12/25/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

// FIXME: Only update frameworks
struct UpdateCommand: CommandProtocol {
    
    typealias Options = UpdateOptions
    
    var verb: String {
        return "update"
    }
    
    var function: String {
        return "Update frameworks and/or configuration"
    }
    
    func run(_ options: UpdateOptions) -> Result<(), CommandLineError> {
        
        /*
        print("upate frameworks: \(options.updateFrameworks), configuration: \(options.updateConfiguration)")
        */
        return Result<(), CommandLineError>(value: ())
    }
}

struct UpdateOptions: OptionsProtocol {
    
    typealias ClientError = CommandLineError
    
    let updateKinds: [UpdateKind]
    
    static func create(_ updateKinds: [UpdateKind]?) -> UpdateOptions {
        
        print("update: \(updateKinds)")
        
        return UpdateOptions(updateKinds: updateKinds ?? [])
    }
    
    /// Evaluates this set of options in the given mode.
    ///
    /// Returns the parsed options or a `UsageError`.
    public static func evaluate(_ m: CommandMode)
        -> Result<UpdateOptions, CommandantError<CommandLineError>>
    {
        return create
            <*> m <| Argument(defaultValue: [], usage: "Things to update (frameworks, configuration)")
    }
}

enum UpdateKind {
    case frameworks
    case configuration
    case multiple([UpdateKind])
}

extension UpdateKind: ArgumentProtocol {
    
    static let name = "update"
    
    private static let acceptedStrings: [String: UpdateKind] = [
        "frameworks": .frameworks,
        "f": .frameworks,
        "configuration": .configuration,
        "c": .configuration,
    ]
    
    static func from(string: String) -> UpdateKind? {
        let tokens = string.split()
        
        let findUpdateKind: (String) -> UpdateKind? = { string in
            return self.acceptedStrings.lazy
                .filter { key, _ in string.caseInsensitiveCompare(key) == .orderedSame }
                .map { _, kind in kind }
                .first
        }
        
        switch tokens.count {
        case 0:
            return nil
        case 1:
            return findUpdateKind(tokens[0])
        default:
            var updateKinds: [UpdateKind] = []
            for token in tokens {
                if let found = findUpdateKind(token) {
                    updateKinds.append(found)
                } else {
                    return nil
                }
            }
            return .multiple(updateKinds)
        }
    }
}

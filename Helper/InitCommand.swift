//
//  InitCommand.swift
//  Helper
//
//  Created by James Bean on 12/25/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation
//
//struct InitCommand: CommandProtocol {
//    
//    //typealias Options: = <#T##Type###>
//}

struct InitOptions: OptionsProtocol {
    
    typealias ClientError = OptionsError
    
    // Refactor as `struct Platform: OptionSetType`
    enum Platform: String {
        case iOS
        case macOS
        case all
    }
    
    enum TargetKind: String {
        case framework
        case application
    }
    
    let platform: Platform
    let targetKind: TargetKind
    let doesGenerateDemos: Bool
    
    // FIXME: Refactor to better represent problem domain
    // FIXME: Defaults not necessary, they are described in `create(...)`
    init(
        platform: Platform,
        targetKind: TargetKind,
        shouldGenerateDemos doesGenerateDemos: Bool
    )
    {
        self.platform = platform
        self.targetKind = targetKind

        // Only generate demos if framework and user explicitly chooes to
        self.doesGenerateDemos = targetKind == .framework && doesGenerateDemos ? true : false
    }
    
    static func create(_ platform: String) -> (String) -> (Bool) -> InitOptions {
        return { targetKind in
            return { shouldGenerateDemos in
                return InitOptions(
                    platform: Platform(rawValue: platform) ?? .all,
                    targetKind: TargetKind(rawValue: targetKind) ?? .framework,
                    shouldGenerateDemos: shouldGenerateDemos
                )
            }
        }
    }
 
    /// Evaluates this set of options in the given mode.
    ///
    /// Returns the parsed options or a `UsageError`.
    static func evaluate(_ m: CommandMode)
        -> Result<InitOptions, CommandantError<OptionsError>>
    {
        let platformUsage = "Which platforms for which to build [ iOS | macOS | all ]"
        let targetUsage = "Which type of target [ framework | application ]"
        let demosUsage = "In the case of building a framework, whether or not to build demo application targets"
        
        return create
            <*> m <| Option(key: "platform", defaultValue: "all", usage: platformUsage)
            <*> m <| Option(key: "target", defaultValue: "framework", usage: targetUsage)
            <*> m <| Option(key: "generate demos", defaultValue: false, usage: demosUsage)
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

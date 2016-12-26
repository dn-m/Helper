//
//  Init.swift
//  Helper
//
//  Created by James Bean on 12/25/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

struct InitCommand: CommandProtocol {
    
    typealias Options = InitOptions
    
    var verb: String {
        return "init"
    }
    
    var function: String {
        return "Create a new xcode project"
    }
    
    func run(_ options: InitOptions) -> Result<(), CommandLineError> {
        
        do {
            try initializeProject(name: Project.name, in: Project.directory)
        } catch {
            print("Could not initialize project: \(error)")
        }
        
        return Result<(), CommandLineError>(value: ())
    }
}

struct InitOptions: OptionsProtocol {
    
    typealias ClientError = CommandLineError
    
    static func evaluate(_ m: CommandMode) -> Result<InitOptions, CommandantError<CommandLineError>> {
        return Result<InitOptions, CommandantError<CommandLineError>>(value: InitOptions())
    }
}

/*
struct InitCommand: CommandProtocol {
    
    typealias Options = InitOptions
    
    var verb: String {
        return "init"
    }
    
    var function: String {
        return "Create a new, configured Xcode project"
    }
    
    // TODO: Implement
    func run(_ options: InitOptions) -> Result<(), CommandLineError> {
        print("\(options.platform) \(options.targetKind) \(options.doesGenerateDemos)")
        return Result<(), CommandLineError>(value: ())
    }
}
*/

/*
struct InitOptions: OptionsProtocol {
    
    typealias ClientError = CommandLineError
    
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
        print("init!")
        
        self.platform = platform
        self.targetKind = targetKind

        // Only generate demos if framework and user explicitly chooes to
        self.doesGenerateDemos = targetKind == .framework && doesGenerateDemos ? true : false
    }
    
    static func create(_ platform: String) -> (String) -> (Bool) -> InitOptions {
        
        print("create!")
        
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
        -> Result<InitOptions, CommandantError<CommandLineError>>
    {
        print("evaluate!")
        
        let platformUsage = "Which platforms for which to build [ iOS | macOS | all ]"
        let targetUsage = "Which type of target [ framework | application ]"
        let demosUsage = "In the case of building a framework, whether or not to build demo application targets"
        
        return create
            <*> m <| Option(key: "platform", defaultValue: "all", usage: platformUsage)
            <*> m <| Option(key: "type", defaultValue: "framework", usage: targetUsage)
            <*> m <| Option(key: "demos", defaultValue: false, usage: demosUsage)
    }
}
*/

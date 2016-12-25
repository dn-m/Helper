//
//  main.swift
//  Helper
//
//  Created by James Bean on 12/25/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

// Prepare commands
let registry = CommandRegistry<CommandLineError>()
registry.register(InitCommand())
registry.register(ConfigCommand())
registry.register(UpdateCommand())

// Parse commands and run necessary processes
registry.main(defaultVerb: "update") { error in
    print("fuck")
    exit(1)
}

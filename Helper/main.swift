//
//  main.swift
//  Helper
//
//  Created by James Bean on 12/25/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

let registry = CommandRegistry<CommandLineError>()

func prepareCommands() {
    registry.register(InitCommand())
    registry.register(ConfigCommand())
    // TODO: UpdateCommand
}

func runCommands() {
    registry.main(defaultVerb: "config") { error in
        print(error)
        exit(1)
    }
}

prepareCommands()
runCommands()

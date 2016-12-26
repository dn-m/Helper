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

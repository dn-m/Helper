//
//  main.swift
//  Helper
//
//  Created by James Bean on 12/25/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

// All arguments (not including program name (dn-m))
var arguments = CommandLine.arguments.dropFirst()

guard !arguments.isEmpty else {
    
    // TODO: Show help
    
    print("No commands or options given.")
    exit(1)
}


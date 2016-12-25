//
//  StringExtensions.swift
//  Helper
//
//  Created by James Bean on 12/25/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

extension String {
    
    mutating func line(_ string: String = "") {
        append(string + "\n")
    }
}

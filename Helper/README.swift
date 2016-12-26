//
//  README.swift
//  Helper
//
//  Created by James Bean on 12/25/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

/// Create a `README.md` file for a given `projectName` in the given `directory`.
internal func createREADME(projectName: String, in directory: URL) throws {
    let contents = prepareREADMEContents(projectName: projectName)
    try createFile(name: "README.md", in: directory, contents: contents)
}

/// - returns: `String` contents of `README.md` for a given `projectName`.
private func prepareREADMEContents(projectName: String) -> String {
    return Readme(projectName: projectName).contents
}

private struct Readme {
    
    /// Name of project
    let projectName: String
    
    var contents: String {
        var result = ""
        result.line(title)
        result.line()
        result.line(badges)
        result.line()
        result.line(integration)
        result.line()
        result.line("---")
        result.line()
        result.line(documentation)
        return result
    }
    
    private var title: String {
        return "# \(projectName)";
    }
    
    private var badges: String {
        var result = ""
        result.line(swiftVersionBadge + " ")
        result.line(travisCIBadge + " ")
        result.line(codeCovBadge + " ")
        result.line(carthageBadge + " ")
        result.line(versionBadge)
        return result
    }
    
    private var swiftVersionBadge: String {
        return "![Swift](https://img.shields.io/badge/%20in-swift%203.0-orange.svg)"
    }
    
    private var travisCIBadge: String {
        return "[![Build Status](https://travis-ci.org/dn-m/\(projectName).svg?branch=master)](https://travis-ci.org/dn-m/\(projectName))"
    }
    
    private var codeCovBadge: String {
        return "[![codecov](https://codecov.io/gh/dn-m/\(projectName)/branch/master/graph/badge.svg)](https://codecov.io/gh/dn-m/\(projectName))"
    }
    
    private var carthageBadge: String {
        return "[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)"
    }
    
    private var versionBadge: String {
        return "[![GitHub version](https://badge.fury.io/gh/dn-m%2F\(projectName).svg)](https://badge.fury.io/gh/dn-m%2F\(projectName))"
    }
    
    // MARK: - Integration
    
    private var integration: String {
        var result = ""
        result.line("## Integration")
        result.line()
        result.line("### Carthage")
        result.line("Integrate **\(projectName)** into your macOS or iOS project with [Carthage](https://github.com/Carthage/Carthage).")
        result.line()
        result.line("1. Follow [these instructions](https://github.com/Carthage/Carthage#installing-carthage) to install Carthage, if necessary.")
        result.line("2. Add `github \"dn-m/\(projectName)\"` to your [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile).")
        result.line("3. Follow [these instructions](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application) to integrate **\(projectName)** into your macOS or iOS project.")
        return result
    }
    
    private var documentation: String {
        var result = ""
        result.line("### Documentation")
        result.line("See the [documentation](http://dn-m.github.io/\(projectName)/).")
        return result
    }
}

//
//  Configuration.swift
//  Helper
//
//  Created by James Bean on 12/25/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

func configuration(projectName: String, directory: URL) throws {
    try createGitIgnore(in: directory)
    try createTravisYML(projectName: projectName, in: directory)
    try createSwiftLintYML(in: directory)
    try createHoundYML(in: directory)
    try createCartfile(in: directory)
    try createREADME(projectName: projectName, in: directory)
}

//
//  initializeProject().swift
//  Helper
//
//  Created by James Bean on 12/26/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

func initializeProject(name: String, in directory: URL) throws {
    try createFileStructure(projectName: name, in: directory)
    // configureProject()
    print("trying to run ruby")
    shell("ruby", "/usr/local/bin/test.rb")
}

// Create directories for primary and test targets
func createFileStructure(projectName: String, in directory: URL) throws {
    try [projectName, "\(projectName)Tests"].forEach { name in
        try createDirectory(name: name, in: directory)
    }
}

func configureProject() {
    /*
     createProject()
     createInfoPropertyLists()
     configurePBXGroups()
     configureTargets()
     configureHeader()
     configureSchemes()
     configureBuildConfigurationSettings()
     addCopyBuildPhaseForTestTargets()
    */
}

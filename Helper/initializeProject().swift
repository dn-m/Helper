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
    
}

func createFileStructure(projectName: String, in directory: URL) throws {
    // create folders for main and test target
    try createDirectory(name: projectName, in: directory)
    try createDirectory(name: "\(projectName).tests", in: Project.directory)
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

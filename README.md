# Helper

Command line utility for generating and maintaining frameworks and applications in the **dn-m** project.

This project uses [Cocoapods/Xcodeproj](https://github.com/CocoaPods/Xcodeproj) to generate and inject frameworks into Xcode project, and [Commander](https://github.com/commander-rb/commander) for the command line argument parsing.

## Dependencies
- [Carthage](https://github.com/Carthage/Carthage)
- [Ruby](https://www.ruby-lang.org/en/)
- [Bundler](http://bundler.io/)
	- [`xcodeproj`](https://github.com/CocoaPods/Xcodeproj)
	- [`commander`](https://github.com/commander-rb/commander)

## Integration

0. Ensure that Ruby and Bundler are installed
1. `git clone https://github.com/dn-m/Helper` or download the zip from the latest [release](https://github.com/dn-m/Helper/releases)
2. `cd Helper`
3. `bundle install` (this will install all of the ruby gem dependencies)
4. `cp dn-m /usr/local/bin`

If you have any issues, it's worth giving `brew update` / `brew upgrade` a shot.

## Usage

### Creating a project

Create a new directory with the name of the new project:
- `mkdir NameOfNewProject` 

Navigate to that directory:
- `cd NameOfNewProject`

#### `dn-m init` 
- Creates a new iOS + macOS framework from scratch
- Calls `config`
	
#### `dn-m config`
- Creates the necessary configuration files for:
    - Version tracking with [git](https://git-scm.com/)
    - Dependency management with [Carthage](https://github.com/Carthage/Carthage)
    - Testing with [Travis CI](https://travis-ci.org/)
    - Code coverage with [Codecov](https://codecov.io/)
    - Code style with [Hound CI](https://houndci.com/) and [SwiftLint](https://github.com/realm/SwiftLint)
- Creates `README.md`

### Maintaining a project

#### `dn-m update`
- Updates framework dependencies via [Carthage](https://github.com/Carthage/Carthage)
- Calls `inject`
	
#### `dn-m inject`
- Injects framework dependencies into project

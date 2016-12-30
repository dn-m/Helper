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
1. Download zip from latest release
2. `cp dn-m /usr/local/bin`

## Usage

- `dn-m init`
- `dn-m config`
- `dn-m update`

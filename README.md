# Helper
Command line interface for managing **dn-m** frameworks.

## Integration

### Dependencies

This project uses the [CocoaPods/Xcodeproj](https://github.com/CocoaPods/Xcodeproj) framework, written in [Ruby](https://www.ruby-lang.org/en/). 

As such, there are a few dependencies. To get started, try:

0. Install [Homebrew](brew.sh) 
1. `brew install ruby`
2. `[sudo] gem install xcodeproj -i /usr/local/bin`

You should be good to go!

### Clone and build from source
1. `git clone https://github.com/dn-m/Helper`
2. `cd Helper`
3. `xcodebuild`
4. `cp build/Release/dn-m /usr/local/bin/dn-m`

### Download pre-built CLI
1. Download **dn-m** CLI from the most current [release](https://github.com/dn-m/Helper/releases).
2. Copy **dn-m** CLI to `/usr/local/bin/dn-m`

## Usage

- `dn-m config`
  - Produces `README.md`, `.travis.yml`, `.hound.yml`, `.swiftlint.yml` and `.gitignore` files.


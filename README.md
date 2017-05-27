Version
===

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![Platform](https://img.shields.io/badge/platform-iOS-yellow.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)
[![Swift Version](https://img.shields.io/badge/Swift-3-F16D39.svg)](https://developer.apple.com/swift)

Version is a swifty version accessor.

# Usage

## Initialization

```swift
let ver1 = Version("1.1.1") // the type is Version?
let ver2: Version = "2.2.2" // the type is Version

let ver3 = Version("not a version string") // => nil
let ver4: Version = "not a version string" // fatalError
```

## Comparison

```swift
let lhs: Version = "1.1.1"
let rhs: Version = "2.2.2"

lhs < rhs // => true
```

```swift
let lhs: Version = "3.0"
let rhs: Version = "2.2.2"

lhs > rhs // => true
```

## Current version

```swift
Version.current            // => 1.0
Version.currentBuildNumber // 1
```


## Adapt a Collection protocol

Version adapts a Collection protocol.

```swift
let ver: Version = "4.3.2.1"
ver[3]    // => 1
ver.count // => 4
```

# Installation

## Carthage

```ruby
github "tattn/Version"
```

# Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

# License

Version is released under the MIT license. See LICENSE for details.

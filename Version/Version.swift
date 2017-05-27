//
//  Version.swift
//  Version
//
//  Created by Tatsuya Tanaka on 2017/04/14.
//  Copyright © 2017年 tattn. All rights reserved.
//

import Foundation

public struct Version {

    public let components: [Int]

    static var bundle: Bundle = .main

    public init() {
        components = []
    }

    public init?(_ versionString: String) {
        let separatedStrings = versionString.components(separatedBy: ".")
        components = separatedStrings.flatMap { Int($0) }

        // parse check
        guard !isEmpty, separatedStrings.count == count else {
            return nil
        }
    }
}

extension Version {
    public static var current: Version {
        guard let versionString = bundle.infoDictionary?["CFBundleShortVersionString"] as? String,
            let version = Version(versionString) else {
                fatalError("CFBundleShortVersionString is not a valid version string")
        }
        return version
    }

    public static var currentBuildNumber: Version {
        guard let versionString = bundle.infoDictionary?["CFBundleVersion"] as? String,
            let version = Version(versionString) else {
                fatalError("CFBundleVersion is not a valid version string")
        }
        return version
    }
}

extension Version: Hashable {

    public var hashValue: Int {
        // 🤔
        var components = self.components
        while let last = components.last, last == 0 {
            components = Array(components.dropLast(1))
        }
        return components.map(String.init).joined(separator: ".").hashValue
    }
}

extension Version: Equatable {

    public static func == (lhs: Version, rhs: Version) -> Bool {
        return !zip(lhs, rhs).contains { $0 != $1 }
    }
}

extension Version: Comparable {

    public static func < (lhs: Version, rhs: Version) -> Bool {
        let maxLength = Swift.max(lhs.count, rhs.count)
        for index in (0...maxLength) {
            let left = lhs.count > index ? lhs[index] : 0
            let right = rhs.count > index ? rhs[index] : 0
            if left != right {
                return left < right
            }
        }

        return false
    }
}

extension Version: CustomStringConvertible {
    public var description: String {
        return components.map(String.init).joined(separator: ".")
    }
}

extension Version: ExpressibleByStringLiteral {

    public init(stringLiteral value: String) {
        guard let version = Version(value) else {
            fatalError("\(value) is not a valid version")
        }
        self = version
    }

    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(stringLiteral: value)
    }

    public init(unicodeScalarLiteral value: String) {
        self.init(stringLiteral: value)
    }
}

extension Version: Collection {

    public var startIndex: Int { return 0 }
    public var endIndex: Int { return components.count }

    public subscript (index: Int) -> Int {
        return components[index]
    }

    public func index(after index: Index) -> Int {
        return index + 1
    }
}

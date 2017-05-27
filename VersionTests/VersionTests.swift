//
//  VersionTests.swift
//  VersionTests
//
//  Created by Tatsuya Tanaka on 20170528.
//  Copyright © 2017年 tattn. All rights reserved.
//

import XCTest
@testable import Version

class VersionTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testCompare1() {
        let lhs: Version = "1.1.1"
        let rhs: Version = "2.2.2"
        XCTAssertLessThan(lhs, rhs)
    }

    func testCompare2() {
        let lhs: Version = "1.10.1"
        let rhs: Version = "2.2.2"
        XCTAssertFalse(lhs > rhs)
    }

    func testCompare3() {
        let lhs: Version = "3.0"
        let rhs: Version = "2.2.2"
        XCTAssertGreaterThan(lhs, rhs)
    }

    func testCompare4() {
        let lhs: Version = "1.0.0"
        let rhs: Version = "1"
        XCTAssertEqual(lhs, rhs)
    }

    func testCompare5() {
        let lhs: Version = "1.0.0"
        let rhs: Version = "1"
        XCTAssertEqual(lhs.hashValue, rhs.hashValue)
    }

    func testCompare6() {
        let lhs: Version = "1.0.0"
        let rhs: Version = "0.1.0"
        XCTAssertLessThan(lhs[1], rhs[1])
    }

    func testNotAVersionString() {
        let version = Version("Hello🐱")
        XCTAssertNil(version)
    }

    func testCount() {
        let version: Version = "1.2.3"
        XCTAssertEqual(version.count, 3)
    }

    func testStringInterpolation() {
        let version: Version = "1.2.3"
        XCTAssertEqual("\(version)", "1.2.3")
    }
}

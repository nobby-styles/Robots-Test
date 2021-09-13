//
//  OrientationTests.swift
//  RobotsTestTests
//
//  Created by Robert Redmond on 13/09/2021.
//

import XCTest
@testable import RobotsTest

class OrientationTests: XCTestCase {

    func testMoveLeft() throws {
        var orientation = Orientation(rawValue: "N")
        orientation = orientation?.moveLeft()
        XCTAssertEqual(orientation?.rawValue, "W")
        orientation = orientation?.moveLeft()
        XCTAssertEqual(orientation?.rawValue, "S")
        orientation = orientation?.moveLeft()
        XCTAssertEqual(orientation?.rawValue, "E")
        orientation = orientation?.moveLeft()
        XCTAssertEqual(orientation?.rawValue, "N")
    }
    
    func testMoveRight() throws {
        var orientation = Orientation(rawValue: "N")
        orientation = orientation?.moveRight()
        XCTAssertEqual(orientation?.rawValue, "E")
        orientation = orientation?.moveRight()
        XCTAssertEqual(orientation?.rawValue, "S")
        orientation = orientation?.moveRight()
        XCTAssertEqual(orientation?.rawValue, "W")
        orientation = orientation?.moveRight()
        XCTAssertEqual(orientation?.rawValue, "N")
    }
    
    func testNCoords() throws {
        let orientation = Orientation(rawValue: "N")
        XCTAssertEqual(orientation?.coord().x, 0)
        XCTAssertEqual(orientation?.coord().y, 1)
    }
    
    func testSCoords() throws {
        let orientation = Orientation(rawValue: "S")
        XCTAssertEqual(orientation?.coord().x, 0)
        XCTAssertEqual(orientation?.coord().y, -1)
    }
    
    func testECoords() throws {
        let orientation = Orientation(rawValue: "E")
        XCTAssertEqual(orientation?.coord().x, 1)
        XCTAssertEqual(orientation?.coord().y, 0)
    }
    
    func testWCoords() throws {
        let orientation = Orientation(rawValue: "W")
        XCTAssertEqual(orientation?.coord().x, -1)
        XCTAssertEqual(orientation?.coord().y, 0)
    }
}

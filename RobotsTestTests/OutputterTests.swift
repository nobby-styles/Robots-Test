//
//  OutputterTests.swift
//  RobotsTestTests
//
//  Created by Robert Redmond on 13/09/2021.
//

import Foundation

import XCTest
@testable import RobotsTest

class OutputterTests: XCTestCase {

    func testOneRobot() throws {
        let robot = Robot(orientation: .E, x: 1, y: 1, instructions: "RFRFRFRF")
        let map = Map(maxX: 5, maxY: 3, lostCoords: [Coords]())
        let outputter = RobotOutputter(robots: [robot], map: map)
        let output = outputter.output()
        XCTAssertGreaterThan(output.count, 0)
        XCTAssertEqual(output, "1 1 E /n")
    }
    
    func testLostRobot() throws {
        let robot = Robot(orientation: .N, x: 3, y: 2, instructions: "FRRFLLFFRRFLL")
        let map = Map(maxX: 5, maxY: 3, lostCoords: [Coords]())
        let outputter = RobotOutputter(robots: [robot], map: map)
        let output = outputter.output()
        XCTAssertGreaterThan(output.count, 0)
        XCTAssertEqual(output, "3 3 N LOST /n")
    }
    
    func testThreeRobots() throws {
        let robot1 = Robot(orientation: .E, x: 1, y: 1, instructions: "RFRFRFRF")
        let robot2 = Robot(orientation: .N, x: 3, y: 2, instructions: "FRRFLLFFRRFLL")
        let robot3 = Robot(orientation: .W, x: 0, y: 3, instructions: "LLFFFLFLFL")
        let map = Map(maxX: 5, maxY: 3, lostCoords: [Coords]())
        let outputter = RobotOutputter(robots: [robot1, robot2, robot3], map: map)
        let output = outputter.output()
        XCTAssertGreaterThan(output.count, 0)
        XCTAssertEqual(output, "1 1 E /n3 3 N LOST /n2 3 S /n")
    }
}


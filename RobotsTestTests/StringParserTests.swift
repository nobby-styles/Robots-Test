//
//  RobotsTestTests.swift
//  RobotsTestTests
//
//  Created by Robert Redmond on 12/09/2021.
//

import XCTest
@testable import RobotsTest

class StringParserTests: XCTestCase {

    func testZeroLengthString() throws {
        let parser = StringParser(textToParse: "")
        XCTAssertNil(parser.parse())
    }
    
    func testBadMap3Robots() throws {
        guard let path = Bundle.main.path(forResource: "databadmap", ofType: "txt") else {
            return
            
        }
        do {
            let text = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            let parser = StringParser(textToParse: text)
            let results = parser.parse()
            XCTAssertNil(results)
            
        } catch {
            print("Failed to read text from \(path)")
        }
    }
    
    func testBadRobots() throws {
        guard let path = Bundle.main.path(forResource: "databadrobots", ofType: "txt") else {
            return
            
        }
        do {
            let text = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            let parser = StringParser(textToParse: text)
            let results = parser.parse()
            XCTAssertNil(results)
            
        } catch {
            print("Failed to read text from \(path)")
        }
    }
    
    func testMapCoordsGreaterThan50() throws {
        guard let path = Bundle.main.path(forResource: "datamapgreaterthan50", ofType: "txt") else {
            return
            
        }
        do {
            let text = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            let parser = StringParser(textToParse: text)
            let results = parser.parse()
            XCTAssertNil(results)
            
        } catch {
            print("Failed to read text from \(path)")
        }
        
    }

    func testOneMapThreRobotsOneWithCoordGreaterThan50() throws {
        guard let path = Bundle.main.path(forResource: "datarobotgreaterthan50", ofType: "txt") else {
            return
            
        }
        do {
            let text = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            let parser = StringParser(textToParse: text)
            let results = parser.parse()
            XCTAssertNotNil(results)
            guard let robots = results?.0  else { return }
            XCTAssertEqual(robots.count, 2)
        } catch {
            print("Failed to read text from \(path)")
        }
    }
    
    func testOneMap3Robots() throws {
        guard let path = Bundle.main.path(forResource: "data", ofType: "txt") else {
            return
            
        }
        do {
            let text = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            let parser = StringParser(textToParse: text)
            let results = parser.parse()
            XCTAssertNotNil(results)
            guard let map = results?.1 else { return }
            XCTAssertEqual(map.maxX, 5)
            XCTAssertEqual(map.maxY, 3)
            guard let robots = results?.0  else { return }
            XCTAssertEqual(robots.count, 3)
            XCTAssertEqual(robots[1].orientation.rawValue, "N")
            XCTAssertEqual(robots[1].x, 3)
            XCTAssertEqual(robots[1].y, 2)
            XCTAssertEqual(robots[1].instructions, "FRRFLLFFRRFLL")
            
        } catch {
            print("Failed to read text from \(path)")
        }
    }
    
    func testOneMap3RobotsOneHasInstructionsEqual100Chars() throws {
        guard let path = Bundle.main.path(forResource: "datarobotsinstructioncharacters100", ofType: "txt") else {
            return
            
        }
        do {
            let text = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            let parser = StringParser(textToParse: text)
            let results = parser.parse()
            XCTAssertNotNil(results)
            guard let map = results?.1 else { return }
            XCTAssertEqual(map.maxX, 5)
            XCTAssertEqual(map.maxY, 3)
            guard let robots = results?.0  else { return }
            XCTAssertEqual(robots.count, 2)
            
        } catch {
            print("Failed to read text from \(path)")
        }
    }

}

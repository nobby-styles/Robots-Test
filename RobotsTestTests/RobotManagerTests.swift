//
//  RobotManagerTests.swift
//  RobotsTestTests
//
//  Created by Robert Redmond on 13/09/2021.
//

import XCTest
@testable import RobotsTest


class RobotManagerTests: XCTestCase {

    func testInputFileDoesntExist() throws {
        let manager = RobotManager(inputFileName: "test", outputFileName: "test")
        XCTAssertFalse(manager.processAndOutput())
    }
    
    func testBadMapData() throws {
        let manager = RobotManager(inputFileName: "databadmap", outputFileName: "test")
        XCTAssertFalse(manager.processAndOutput())
    }
    
    func testBadRobots() throws {
        let manager = RobotManager(inputFileName: "databadrobot", outputFileName: "test")
        XCTAssertFalse(manager.processAndOutput())
    }
    
    func testMapAnd3RobotsOutput() throws {
        let manager = RobotManager(inputFileName: "data", outputFileName: "test")
        XCTAssertTrue(manager.processAndOutput())
        var strOutput: String?
        var testOutput: String?
        
        // get the ouput file from the doc directory
        guard let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileURL = dir.appendingPathComponent("test")
        do {
            strOutput = try String(contentsOf: fileURL, encoding: .utf8)
        }
        catch {
            debugPrint("no file")
        }
        
        // get the test file from the bundle directory
        guard let path = Bundle.main.path(forResource: "outputtest", ofType: "txt") else {
            return
            
        }
        do {
            testOutput = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
        }
        catch {
            debugPrint("no file")
        }
        XCTAssertNotNil(strOutput)
        
        // both files should be the same
        XCTAssertEqual(testOutput, strOutput)
    }
    
}

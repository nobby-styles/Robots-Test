//
//  FileInputOutputManagerTests.swift
//  RobotsTestTests
//
//  Created by Robert Redmond on 13/09/2021.
//

import XCTest
@testable import RobotsTest

class FileInputOutpuManagerTests: XCTestCase {
    
    func testInputFileDoesntExist() throws {
        let manager = FileInputOutputManager(inputFileName: "test", outputFileName: "test")
        XCTAssertNil(manager.stringForParsing())
    }
    
    func testOutputSaves() throws {
        let manager = FileInputOutputManager(inputFileName: "test", outputFileName: "filemanager")
        XCTAssertTrue(manager.save(string: "testing12356677787800"))
        var strOutput: String?
        guard let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileURL = dir.appendingPathComponent("filemanager")
        do {
            strOutput = try String(contentsOf: fileURL, encoding: .utf8)
        }
        catch {
            debugPrint("no file")
        }
        XCTAssertNotNil(strOutput)
        XCTAssertEqual(strOutput, "testing12356677787800")
    }

    
}

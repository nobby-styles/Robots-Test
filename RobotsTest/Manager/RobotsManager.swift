//
//  RobotsManager.swift
//  RobotsTest
//
//  Created by Robert Redmond on 12/09/2021.
//

import Foundation

class RobotManager {

    let ouputFileName: String
    let parser: Parser?
  
  
    init(inputFileName: String, outputFileName: String) {
        self.ouputFileName = outputFileName
        guard let path = Bundle.main.path(forResource: inputFileName, ofType: "txt") else {
            debugPrint("no file exists at this loocation")
            parser = nil
            return
        }
        do {
            let text = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            self.parser = Parser(textToParse: text)
            
        } catch {
            parser = nil
            debugPrint("Failed to read text from \(path)")
        }
       
    }
    
    func processAndOutput() -> Bool{
        guard let parser = parser, let result = parser.parse(), !result.robots.isEmpty else { return false }
        let outputter = Outputter(robots: result.robots, map: result.map)
        let outputString = outputter.output()
        guard !outputString.isEmpty else { return false }
        let filename = getDocumentsDirectory().appendingPathComponent(ouputFileName)
        do {
            try outputString.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            return false
        }
        return true
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    
}

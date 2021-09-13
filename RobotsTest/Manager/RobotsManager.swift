//
//  RobotsManager.swift
//  RobotsTest
//
//  Created by Robert Redmond on 12/09/2021.
//

import Foundation

// RobotsManager is responsible for handling the interactions between the inputoutputmanager, parser and outputter
class RobotsManager {
    var parser: Parser? = nil
    let inputOutputManger: InputOutputManager
  
    init(inputFileName: String, outputFileName: String) {
        self.inputOutputManger = FileInputOutputManager(inputFileName: inputFileName, outputFileName: outputFileName)
        guard let stringForParsing = inputOutputManger.stringForParsing() else { return }
        self.parser = Parser(textToParse: stringForParsing)
    }
    
    func processAndOutput() -> Bool{
        guard let parser = parser, let result = parser.parse(), !result.robots.isEmpty else { return false }
        let outputter = Outputter(robots: result.robots, map: result.map)
        let outputString = outputter.output()
        guard !outputString.isEmpty else { return false }
        return inputOutputManger.save(string: outputString)
    }
    


}

//
//  Parser.swift
//  RobotsTest
//
//  Created by Robert Redmond on 12/09/2021.
//

import Foundation

// The parser coverts the text into a map object and robot object
class Parser {
    let textToParse: String
    
    init(textToParse: String) {
        self.textToParse = textToParse
    }

    func parse() -> (robots: [Robot], map: Map)? {
        guard textToParse.count > 0 else {
            return nil
        }
        var parts = textToParse.split(whereSeparator: \.isNewline)
        guard let map = createMap(string: String(parts[0])) else { return nil } // must have a map
        parts.remove(at: 0)
        
        // should have pairs of robot data
        guard parts.count % 2 == 0 else { return nil}
        
        // striding to get the two lines of data for the robot data
        let robots = stride(from: 0, to: parts.count - 1, by: 2).compactMap {
            createRobot(startingPositon: String(parts[$0]), instructions: String(parts[$0 + 1]))
        }
        
        // should have some robots
        guard robots.count > 0 else { return nil }
        return (robots, map)
    }
    
    private func createMap(string: String) -> Map? {
        let arr = string.components(separatedBy: " ")
        
        // check for x and y being less than or equal to 50 which is max size of map
        guard let maxX = Int(arr[0]),
              let  maxY = Int(arr[1]),
              maxX <= 50,
              maxY <= 50,
              arr.count == 2
        else { return nil }
        return Map(maxX: maxX, maxY: maxY, lostCoords: [Coords]())
    }
    
    private func createRobot(startingPositon: String, instructions: String) -> Robot? {
        let positionArr = startingPositon.components(separatedBy: " ")
        
        // check for x and y being less than or equal to 50 which is max size of robot position and also instructions string length being less than 100
        guard let x = Int(positionArr[0]),
              let y = Int(positionArr[1]),
              let orientation = Orientation(rawValue: positionArr[2]),
              x <= 50,
              y <= 50,
              !instructions.isEmpty,
              instructions.count < 100,
              positionArr.count == 3
        else { return nil }
        
        return Robot(orientation: orientation, x: x, y: y, instructions: instructions)
    }
}

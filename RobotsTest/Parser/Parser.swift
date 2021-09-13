//
//  Parser.swift
//  RobotsTest
//
//  Created by Robert Redmond on 12/09/2021.
//

import Foundation

protocol Parser {
    func parse() -> ([Robot], Map)?
}

class StringParser: Parser {
    let textToParse: String
    
    init(textToParse: String) {
        self.textToParse = textToParse
    }

    func parse() -> ([Robot], Map)? {
        guard textToParse.count > 0 else {
            return nil
        }
        var parts = textToParse.split(whereSeparator: \.isNewline)
        guard let map = createMap(string: String(parts[0])) else { return nil } // must have a map
        parts.remove(at: 0)
        guard parts.count % 2 == 0 else { return nil} // should have pairs of robot data
        let robots = stride(from: 0, to: parts.count - 1, by: 2).compactMap {
            createRobot(startingPositon: String(parts[$0]), instructions: String(parts[$0 + 1]))
        }
        guard robots.count > 0 else { return nil } // should have some robots
        return (robots, map)
    }
    
    private func createMap(string: String) -> Map? {
        let arr = string.components(separatedBy: " ")
        guard let maxX = Int(arr[0]), let  maxY = Int(arr[1]), maxX <= 50, maxY <= 50,  arr.count == 2 else { return nil }
        return Map(maxX: maxX, maxY: maxY, lostCoords: [Coords]())
    }
    
    private func createRobot(startingPositon: String, instructions: String) -> Robot? {
        let positionArr = startingPositon.components(separatedBy: " ")
        guard let x = Int(positionArr[0]), let y = Int(positionArr[1]), let orientation = Orientation(rawValue: positionArr[2]), x <= 50, y <= 50, instructions.count < 100, positionArr.count == 3 else { return nil }
        return Robot(orientation: orientation, x: x, y: y, instructions: instructions)
    }
}

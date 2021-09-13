//
//  Robot.swift
//  RobotsTest
//
//  Created by Robert Redmond on 12/09/2021.
//

import Foundation

enum Orientation: String {
    case N
    case S
    case E
    case W
    
    // this is the coordinate to add when the robot moves forward
    func coord() -> (x: Int, y: Int) {
        switch self {
        case .N:
            return (0, 1)
        case .S:
            return (0, -1)
        case .E:
            return (1, 0)
        case .W:
            return (-1, 0)
        }
    }
    
    // rotates left around the compass
    func moveLeft() -> Orientation {
        switch self {
        case .N:
            return .W
        case .S:
            return .E
        case .E:
            return .N
        case .W:
            return .S
        }
    }
    
    // rotates right around the compass
    func moveRight() -> Orientation {
        switch self {
        case .N:
            return .E
        case .S:
            return .W
        case .E:
            return .S
        case .W:
            return .N
        }
    }
    
}

struct Robot {
    var orientation: Orientation
    var x: Int
    var y: Int
    var isLost = false
    let instructions: String
}

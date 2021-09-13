//
//  Ouputter.swift
//  RobotsTest
//
//  Created by Robert Redmond on 12/09/2021.
//

import Foundation

enum Instructions: String {
    case L
    case R
    case F
}

class RobotOutputter {
    let robots: [Robot]
    var map: Map
    
    init(robots: [Robot], map: Map) {
        self.robots = robots
        self.map = map
    }
    
    func output() -> String {
        var outputString = ""
        for robot in robots {
           outputString = "\(outputString)\(move(robot: robot))/n"
        }
        return outputString
    }
    
    private func move(robot: Robot) -> String {
        var robot = robot
        let instructios = robot.instructions.map { String($0) }
        for instruction in instructios {
            switch instruction {
            case Instructions.L.rawValue:
                robot.orientation = robot.orientation.moveLeft()
            case Instructions.R.rawValue:
                robot.orientation = robot.orientation.moveRight()
            case Instructions.F.rawValue:
                let robotX = robot.x + robot.orientation.coord().x
                let robotY = robot.y + robot.orientation.coord().y
                let coordToCheck  = Coords(robotX , robotY)
                let checked = map.lostCoords.filter{
                    $0.x == coordToCheck.x && $0.y == coordToCheck.y
                }
                if checked.isEmpty {
                    robot.x = robotX
                    robot.y = robotY
                    if robot.x > map.maxX || robot.y > map.maxY {
                        robot.isLost = true
                        map.lostCoords.append((robot.x, robot.y))
                        break
                    }
                }
            default:
                break
            }
        }
        
        return "\(robot.x) \(robot.y) \(robot.orientation) \(robot.isLost ? "LOST " : "")"
    }
}

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
}

struct Robot {
    var orientation: Orientation
    var x: Int
    var y: Int
    let instructions: String
}

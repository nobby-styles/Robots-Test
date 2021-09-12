//
//  Map.swift
//  RobotsTest
//
//  Created by Robert Redmond on 12/09/2021.
//

import Foundation

typealias Coords = (Int, Int)

struct Map {
    let maxX: Int
    let maxY: Int
    var lostCoords: [Coords]
}

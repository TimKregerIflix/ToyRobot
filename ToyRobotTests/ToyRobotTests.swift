//
//  ToyRobotTests.swift
//  ToyRobotTests
//
//  Created by Tim Kreger on 19/2/20.
//  Copyright © 2020 audioreactive. All rights reserved.
//

import XCTest
import ToyRobot

class ToyRobotTests: XCTestCase {
    
    var board: Board!
    var parser: CommandParser!
    var robot: Robot!
    override func setUp() {
        board = Board(xmin: 0, ymin: 0, xmax: 5, ymax: 5)
        parser = CommandParser(with: board)
        robot = Robot(board: board, direction: Direction(rawValue: "NORTH")!, position: (-5, -5))
    }
    
    // a) PLACE 0,0, NORTH MOVE REPORT Output: 0,1,NORTH
    func test_acceptance1() {
        let commandString = "PLACE 0,0, NORTH MOVE REPORT"
        parser.parse(string: commandString)
        parser.executeSequence(with: robot)

        XCTAssertTrue(robot.position == (0, 1))
        XCTAssert(robot.direction == .north)
        
    }

    // b) PLACE 0,0, NORTH LEFT REPORT Output: 0,0,WEST
    func test_acceptance2() {
        let commandString = "PLACE 0,0, NORTH LEFT REPORT"
        parser.parse(string: commandString)
        parser.executeSequence(with: robot)

        XCTAssertTrue(robot.position == (0, 0))
        XCTAssert(robot.direction == .west)
    }

    // c) PLACE 1,2, EAST MOVE MOVE LEFT MOVE REPORT Output: 3,3,NORTH
    func test_acceptance3() {
        let commandString = "PLACE 1,2, EAST MOVE MOVE LEFT MOVE REPORT"
        parser.parse(string: commandString)
        parser.executeSequence(with: robot)

        XCTAssertTrue(robot.position == (3, 3))
        XCTAssert(robot.direction == .north)
    }

}

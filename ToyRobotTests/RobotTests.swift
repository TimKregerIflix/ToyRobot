//
//  RobotTests.swift
//  ToyRobotTests
//
//  Created by Tim Kreger on 19/2/20.
//  Copyright © 2020 audioreactive. All rights reserved.
//

import XCTest
@testable import ToyRobot

class RobotTests: XCTestCase {

    func test_initializer() {
        let board = Board(xmin: 0, ymin: 0, xmax: 5, ymax: 5)
        let direction = Direction(rawValue: "NORTH")!
        let robot = Robot(board: board, direction: direction, position: (0, 0))
        
        XCTAssert(robot.board.xmax == 5)
        XCTAssert(robot.direction == .north)
        XCTAssertTrue(robot.position == (0, 0))
    }
    
    func test_move_forward_north() {
        let board = Board(xmin: 0, ymin: 0, xmax: 5, ymax: 5)
        let direction = Direction(rawValue: "NORTH")!
        let robot = Robot(board: board, direction: direction, position: (0, 0))
        
        let position = robot.command(with: Command(rawValue:"MOVE")!)
        
        XCTAssertTrue(position == (0, 1))
    }
    
    func test_move_forward_east() {
       let board = Board(xmin: 0, ymin: 0, xmax: 5, ymax: 5)
       let direction = Direction(rawValue: "EAST")!
       let robot = Robot(board: board, direction: direction, position: (0, 0))
       
       let position = robot.command(with: Command(rawValue:"MOVE")!)
       
       XCTAssertTrue(position == (1, 0))
    }

    func test_move_forward_south() {
        let board = Board(xmin: 0, ymin: 0, xmax: 5, ymax: 5)
        let direction = Direction(rawValue: "SOUTH")!
        let robot = Robot(board: board, direction: direction, position: (0, 4))
        
        let position = robot.command(with: Command(rawValue:"MOVE")!)
        
        XCTAssertTrue(position == (0, 3))
    }

    func test_move_forward_west() {
       let board = Board(xmin: 0, ymin: 0, xmax: 5, ymax: 5)
       let direction = Direction(rawValue: "WEST")!
       let robot = Robot(board: board, direction: direction, position: (4, 0))

       let position = robot.command(with: Command(rawValue:"MOVE")!)

       XCTAssertTrue(position == (3, 0))
    }

    func test_move_forward_north_limit() {
           let board = Board(xmin: 0, ymin: 0, xmax: 5, ymax: 5)
           let direction = Direction(rawValue: "NORTH")!
           let robot = Robot(board: board, direction: direction, position: (0, 5))
           
           let position = robot.command(with:Command(rawValue: "MOVE")!)
           
           XCTAssertTrue(position == (0, 5))
    }
    
    func test_move_forward_east_limit() {
        let board = Board(xmin: 0, ymin: 0, xmax: 5, ymax: 5)
        let direction = Direction(rawValue: "EAST")!
        let robot = Robot(board: board, direction: direction, position: (5, 0))
       
        let position = robot.command(with: Command(rawValue:"MOVE")!)
        XCTAssertTrue(position == (5, 0))
    }

    func test_move_forward_south_limit() {
        let board = Board(xmin: 0, ymin: 0, xmax: 5, ymax: 5)
        let direction = Direction(rawValue: "SOUTH")!
        let robot = Robot(board: board, direction: direction, position: (0, 0))
       
        let position = robot.command(with: Command(rawValue:"MOVE")!)
        XCTAssertTrue(position == (0, 0))
    }


}

//
//  BoardTests.swift
//  ToyRobotTests
//
//  Created by Tim Kreger on 19/2/20.
//  Copyright © 2020 audioreactive. All rights reserved.
//

import XCTest
@testable import ToyRobot

class BoardTests: XCTestCase {
    // Just going to short cut this and do all test in one
    func test_initialzer() {
        let board = Board(xmin: 0, ymin: 0, xmax: 5, ymax: 5)
        XCTAssert(board.xmax == 5)
        XCTAssert(board.ymax == 5)
        XCTAssert(board.xmin == 0)
        XCTAssert(board.ymin == 0)
    }
}


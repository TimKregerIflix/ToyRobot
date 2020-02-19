//
//  DirectionTests.swift
//  ToyRobotTests
//
//  Created by Tim Kreger on 19/2/20.
//  Copyright © 2020 audioreactive. All rights reserved.
//

import XCTest
import ToyRobot

class DirectionTests: XCTestCase {
    func test_initializer_with_valid_value() {
        let direction = Direction(rawValue: "NORTH")
        XCTAssert(direction == Direction.north)
    }
    
    func test_initializer_with_invalid_value() {
        let direction = Direction(rawValue: "BLAT")
        XCTAssertNil(direction)
    }
    
    func test_vector_for_north() {
        let direction = Direction(rawValue: "NORTH")!
        XCTAssertTrue(direction.vector(from: direction) == (0, 1))
    }
    
    func test_vector_for_east() {
        let direction = Direction(rawValue: "EAST")!
        XCTAssertTrue(direction.vector(from: direction) == (1, 0))
    }
    
    func test_vector_for_south() {
        let direction = Direction(rawValue: "SOUTH")!
        XCTAssertTrue(direction.vector(from: direction) == (0, -1))
    }
    
    func test_vector_for_west() {
        let direction = Direction(rawValue: "WEST")!
        XCTAssertTrue(direction.vector(from: direction) == (-1, 0))
    }
    
    // Will test all in one test as also need test wrap around
    func test_rotation_left() {
        var direction = Direction(rawValue: "NORTH")!
        
        direction = direction.rotateLeft(current: direction)
        XCTAssertTrue(direction == .west)
        
        direction = direction.rotateLeft(current: direction)
        XCTAssertTrue(direction == .south)
        
        direction = direction.rotateLeft(current: direction)
        XCTAssertTrue(direction == .east)
        
        direction = direction.rotateLeft(current: direction)
        XCTAssertTrue(direction == .north)
    }
    
    // Will test all in one test as also need test wrap around
    func test_rotation_right() {
        var direction = Direction(rawValue: "NORTH")!
        
        direction = direction.rotateRight(current: direction)
        XCTAssertTrue(direction == .east)
        
        direction = direction.rotateRight(current: direction)
        XCTAssertTrue(direction == .south)
        
        direction = direction.rotateRight(current: direction)
        XCTAssertTrue(direction == .west)
        
        direction = direction.rotateRight(current: direction)
        XCTAssertTrue(direction == .north)
    }

}

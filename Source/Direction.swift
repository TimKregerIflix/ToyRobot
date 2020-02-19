//
//  Direction.swift
//  ToyRobot
//
//  Created by Tim Kreger on 19/2/20.
//  Copyright © 2020 audioreactive. All rights reserved.
//

enum Direction: String {
    case north = "NORTH"
    case east = "EAST"
    case south = "SOUTH"
    case west = "WEST"

    func vector(from: Direction) -> (Int, Int) {
        switch from {
        case .north:
            return (0, 1)
        case .east:
            return (1, 0)
        case .south:
            return (0, -1)
        case .west:
            return (-1, 0)
    
        }
    }

    func rotateLeft(current: Direction) -> Direction {
        switch current {
        case .north:
            return .west
        case .west:
            return .south
        case .south:
            return .east
        case .east:
            return .north
        }
    }

    func rotateRight(current: Direction) -> Direction {
           switch current {
           case .north:
               return .east
           case .east:
               return .south
           case .south:
               return .west
           case .west:
               return .north
           }
    }

    func move(forward: Direction, from: (Int, Int)) -> (Int, Int) {
        let transform = forward.vector(from: forward)
        return (transform.0 + from.0, transform.1 + from.1)
    }
}


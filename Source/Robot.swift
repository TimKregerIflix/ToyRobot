//
//  Robot.swift
//  ToyRobot
//
//  Created by Tim Kreger on 19/2/20.
//  Copyright © 2020 audioreactive. All rights reserved.
//
enum Command: String {
    case move = "MOVE"
    case left = "LEFT"
    case right = "RIGHT"
    case report = "REPORT"
}

class Robot {
    internal let board: Board
    internal var direction: Direction
    internal var position: (Int, Int)
    
    init(board: Board, direction: Direction, position: (Int, Int)) {
        self.board = board
        self.direction = direction
        self.position = position
    }

    func command(with string: String) -> (Int, Int) {
        guard let command = Command(rawValue: string) else {
            return position
        }

        switch command {
        case .move:
            position = move(forward: direction, from: position)
            return position
        case .left:
            direction = direction.rotateLeft(current: direction)
            return position
        case .right:
            direction = direction.rotateRight(current: direction)
            return position
        case .report:
            return position
        }
    }

    private func move(forward: Direction, from: (Int, Int)) -> (Int, Int) {
        let transform = forward.vector(from: forward)
        let newPos = (transform.0 + from.0, transform.1 + from.1)
        guard checkSafety(point: newPos) else { return from }
        return newPos
    }

    private func checkSafety(point: (Int, Int)) -> Bool {
        switch point {
        case (board.xmin...board.xmax, board.ymin...board.ymax):
            return true
        default:
            return false
        }
    }
}

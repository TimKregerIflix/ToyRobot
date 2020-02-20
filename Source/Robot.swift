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

    init(board: Board, direction: Direction = Direction.east, position: (Int, Int) = (5000, 5000)) {
        self.board = board
        self.direction = direction
        self.position = position
    }

    func command(with command: Command) {
        switch command {
        case .move:
            position = move(forward: direction, from: position)
        case .left:
            direction = direction.rotateLeft(current: direction)
        case .right:
            direction = direction.rotateRight(current: direction)
        case .report:
            print("Output: \(position.0),\(position.1),\(direction.rawValue)")
        }
    }

    private func move(forward: Direction, from: (Int, Int)) -> (Int, Int) {
        let transform = forward.vector(from: forward)
        let newPos = (transform.0 + from.0, transform.1 + from.1)
        guard board.checkSafety(point: newPos) else { return from }
        return newPos
    }

    func place(position: (Int, Int), direction: String) {
        guard board.checkSafety(point: position) else { return }
        self.position = position
        if let facing =  Direction(rawValue: direction) {
            self.direction = facing
        }
    }
}

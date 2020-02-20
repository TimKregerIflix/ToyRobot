//
//  main.swift
//  ToyRobot
//
//  Created by Tim Kreger on 19/2/20.
//  Copyright © 2020 audioreactive. All rights reserved.
//

import Foundation

let argCount = CommandLine.argc
if argCount > 1 {
    let argument = CommandLine.arguments[1]
    let board = Board(xmin: 0, ymin: 0, xmax: 5, ymax: 5)
    let parser = CommandParser(with: board)
    let robot = Robot(board: board)
    parser.parse(string: argument)
    parser.executeSequence(with: robot)
} else {
    print("Usage - ToyRobot 'PLACE x,y,direction NORTH|EAST|SOUTH|WEST (commands) MOVE|LEFT|RIGHT|REPORT`")
    print("The PLACE operator may be used again in place of command but must use the form `PLACE x,y,DIR")
}

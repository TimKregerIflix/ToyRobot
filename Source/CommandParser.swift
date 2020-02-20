//
//  CommandParser.swift
//  ToyRobotTests
//
//  Created by Tim Kreger on 19/2/20.
//  Copyright © 2020 audioreactive. All rights reserved.
//
import Foundation

class CommandParser {
    internal var string = ""
    internal var commands = [String]()
    internal let board: Board

    init(with board: Board) {
        self.board = board
    }

    func parse(string: String) {
        commands.removeAll()
        let rawCommands = string.components(separatedBy:" ")
        guard let firstPlace = rawCommands.firstIndex(of: "PLACE") else { return }
        commands.append(contentsOf: rawCommands[firstPlace..<rawCommands.count])
    }

    func getPlacePosition(from string: String) -> (Int, Int, String)? {
        let coords = string.components(separatedBy: ",")
        if coords.count == 3 {
            let x = Int(coords[0]) ?? 0
            let y = Int(coords[1]) ?? 0
            let direction = coords[safeIndex: 2] ?? "EAST"
            let position = (x, y, direction)
            return position
        }

        return nil
    }

    func executeSequence(with robot: Robot) {
        var index = 0
        while index < commands.count {
            let commandString = commands[index]
            if let command = Command(rawValue: commandString) {
                robot.command(with: command)
            }

            if commandString == "PLACE" {
                index += 1
                guard
                    let command = commands[safeIndex: index],
                    let location = getPlacePosition(from: command)
                else {
                    // Invalid PLACE contruct should probably error out
                    continue
                }

                let position = (location.0, location.1)
                let direction = location.2
                robot.place(position: position, direction: direction)
            }
            index += 1
        }
    }
     
    
}

// From here hackingwithswift.com/example-code/language/how-to-make-array-access-safer-using-a-custom-subscript
// A lot of unsafe indexing
extension Array {
    public subscript(safeIndex index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }

        return self[index]
    }
}

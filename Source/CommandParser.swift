//
//  CommandParser.swift
//  ToyRobotTests
//
//  Created by Tim Kreger on 19/2/20.
//  Copyright © 2020 audioreactive. All rights reserved.
//

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

    func getPlacePosition(from string: String) -> (Int, Int)? {
        let coords = commands[1].components(separatedBy: ",")
        if coords.count == 3 {
            let x = Int(coords[0]) ?? 0
            let y = Int(coords[1]) ?? 0
            let position = (x, y)
            return position
        }

        return nil
    }

    func executeSequence(with robot: Robot) {
        var index = 0
        while index < commands.count {
            let commandString = commands[index]
            if let command = Command(rawValue: commandString) {
                let position = robot.command(with: command)
                print(" Loc = \(position)")
            }

            if commandString == "PLACE" {
                index += 1
                guard
                    let command = commands[safeIndex: index],
                    let position = getPlacePosition(from: command)
                else {
                    // Invalid PLACE contruct should probably error out
                    continue
                }
                index += 1
                if  let direction = commands[safeIndex: index] {
                    robot.place(position: position, direction: direction)
                } else {
                    // Invalid PLACE contruct should probably error out
                    continue
                }
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

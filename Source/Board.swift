//
//  Board.swift
//  ToyRobot
//
//  Created by Tim Kreger on 19/2/20.
//  Copyright © 2020 audioreactive. All rights reserved.
//

struct Board {
    let xmin: Int
    let ymin: Int
    let xmax: Int
    let ymax: Int
    
    func checkSafety(point: (Int, Int)) -> Bool {
           switch point {
           case (xmin...xmax, ymin...ymax):
               return true
           default:
               return false
           }
    }
}

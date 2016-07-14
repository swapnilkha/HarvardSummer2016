//
//  Grid.swift
//  Assignment4
//
//  Created by Swapnil Kha on 7/13/16.
//  Copyright © 2016 Swapnil Kha. All rights reserved.
//

import Foundation
class Grid: GridProtocol
{
    var rows: UInt?
    var cols: UInt?
    required init(rows: Int, cols: Int){}
    func neighbors(row:Int, col: Int) -> [(Int, Int)]{}
    var cellstate : [CellState] =  Array<CellState>(count: rows * cols, repeatedValue: .Empty)
    
    subscript(row: UInt, col: UInt) -> CellState?
    {
        get
        {
            if cellstate.count < Int(row*col) { return nil }
            return cellstate[Int(row * col + col)]
        }
        set (newValue)
        {
            if newValue == nil { return }
            if row < 0 || row >= rows || col < 0 || col >= cols { return }
            let cellrow = row * cols! + col
            cellstate[Int(cellrow)] = newValue!
        }
    }

}




















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
    var rows: UInt
    var cols: UInt

    private var cellstate : [[CellState]] 

    required init(rows: UInt, cols: UInt)
    {
        self.rows = UInt(rows)
        self.cols = UInt(cols)
        cellstate = Array(count: Int(rows),
                     repeatedValue: Array(count: Int(cols),
                        repeatedValue: .Empty))
        
    }
    
    func neighbors(row:Int, col: Int) -> [(Int, Int)]
    {
        var temp: [(Int, Int)] = []
        for x in 0..<cellstate.count
        {
            for y in 0..<cellstate[x].count
            {
                for x1 in (x-1)...(x+1)
                {
                    for y1 in (y-1)...(y+1)
                    {
                        if(x != x1  && y != y1)
                        {
                            if(cellstate[x1][y1] == .Living) { temp.append((row: x1, cols: y1)) }
                            else
                            {
                                let distance = (abs(x - x1), abs(y - y1))
                                switch (distance)
                                {
                                    case (1,1), (1,0), (0,1): temp.append((row: x1, cols: y1))
                                    default: break
                                }
                            }
                        }
                    }
                }
            }
        }
        return temp
    }
    
    subscript(row: Int, col: Int) -> CellState?
    {
        get
        {
            if cellstate.count < Int(row*col) { return nil }
            return cellstate[Int(row)][Int(col)]
        }
        set (newValue)
        {
            if newValue == nil { return }
            if row < 0 || row >= Int(rows) || col < 0 || col >= Int(cols) { return }
            let cellrow = row * Int(cols) + col
            cellstate[Int(cellrow)][0] = newValue!
        }
    }
    
    func returnCellState() -> [[CellState]]{return self.cellstate}
    
    
}


















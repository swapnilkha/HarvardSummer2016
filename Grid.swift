//
//  Grid.swift
//  Assignment4
//
//  Created by Swapnil Kha on 7/13/16.
//  Copyright © 2016 Swapnil Kha. All rights reserved.
//

import Foundation
import UIKit

class Grid: GridProtocol
{
    private(set) var rows: Int
    private(set) var cols: Int
    
    var cellstate : [[CellState]]
        
    required init(rows: Int, cols: Int)
    {
        self.rows = rows
        self.cols = cols
        cellstate = Array(count: Int(rows),
                          repeatedValue: Array(count: Int(cols),
                            repeatedValue: .Empty))
        
        for row in 0..<self.rows
        {
            for col in 0..<self.cols
            {
                if arc4random_uniform(3) == 1
                { cellstate[row][col] = .Alive }
                else { cellstate[row][col] = .Empty }
            }
        }
        
    }
    
    private static let offsets:[Position] = [
        (-1, -1), (-1, 0), (-1, 1),
        ( 0, -1),          ( 0, 1),
        ( 1, -1), ( 1, 0), ( 1, 1)
    ]
    
    func neighbors(pos: Position) -> [Position] {
        return Grid.offsets.map { Position((pos.row + rows + $0.row) % rows,
            (pos.col + cols + $0.col) % cols) }
    }
    
    func livingNeighbors(position: Position) -> Int {
        return neighbors(position)
            .reduce(0) {
                self[$1.row,$1.col]!.isLiving() ? $0 + 1 : $0
        }
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
    
    var points: [(Int,Int)]
    {
        get { return self.points }
    }
    
}



















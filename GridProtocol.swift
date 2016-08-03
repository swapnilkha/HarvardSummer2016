//
//  GridProtocol.swift
//  FinalProject
//
//  Created by Swapnil Kha on 7/28/16.
//  Copyright © 2016 Swapnil Kha. All rights reserved.
//

typealias Position = (row:Int, col: Int)
typealias Cell = (position: Position, state: CellState)
typealias CellInitializer = (Position) -> CellState

protocol GridProtocol
{
    var rows: Int { get }
    var cols: Int { get }
    var cellstate: [[CellState]] { get }
    subscript (i:Int, j:Int) -> CellState? { get set }
    func livingNeighbors(position: Position) -> Int
    func returnCellState() -> [[CellState]]
    var points: [(Int,Int)] { get }
}

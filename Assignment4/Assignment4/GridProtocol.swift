//
//  GridProtocol.swift
//  Assignment4
//
//  Created by Swapnil Kha on 7/13/16.
//  Copyright © 2016 Swapnil Kha. All rights reserved.
//

import UIKit
protocol GridProtocol
{
    var rows: UInt {get}
    var cols: UInt {get}
    init(rows: UInt, cols: UInt)
    func neighbors(row: Int, col: Int) -> [(Int, Int)]
    subscript(row: Int, col: Int) -> CellState? { get set }
}

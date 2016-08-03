//
//  CellState.swift
//  FinalProject
//
//  Created by Swapnil Kha on 7/28/16.
//  Copyright © 2016 Swapnil Kha. All rights reserved.
//

enum CellState
{
    case Empty
    case Died
    case Born
    case Alive
    
    func isLiving() -> Bool
    {
        switch self
        {
            case .Alive, .Born: return true
            case .Died, .Empty: return false
        }
    }
    
    func allValues() -> Array<String>
    {
        let cellarray = ["Alive","Empty","Born","Died"]
        return cellarray
    }
    
    
    func toggle(value: CellState) -> CellState
    {
        switch value
        {
            case .Empty, .Died: return .Alive
            default: return .Died
        }
    }
}

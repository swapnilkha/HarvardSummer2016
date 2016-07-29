//
//  CellState.swift
//  Assignment3
//
//  Created by Swapnil Kha on 7/11/16.
//  Copyright © 2016 Swapnil Kha. All rights reserved.
//

import UIKit
enum CellState: String
{
    case Living = "Living"
    case Empty = "Empty"
    case Born = "Born"
    case Died = "Died"
    
    func description() -> String
    {
        switch self
        {
            case .Living: return "Living"
            case .Empty: return "Empty"
            case .Born: return "Born"
            case .Died: return "Died"
        }
    }
    
    func allValues() -> Array<String>
    {
        let cellarray = ["Living","Empty","Born","Died"]
        return cellarray
    }
    
    
    func toggle(value: CellState) -> CellState
    {
        switch value
        {
            case .Empty, .Died: return .Living
            default: return .Died
        }
    }
    
}


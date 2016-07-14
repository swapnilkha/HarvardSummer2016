//
//  Engine.swift
//  Assignment2
//
//  Created by Swapnil Kha on 7/3/16.
//  Copyright © 2016 Swapnil Kha. All rights reserved.
//

import UIKit

class Engine
{
    func step(array:[[Bool]], numberliving: Int) -> [[Bool]]
    {
        print("There are \(numberliving) living cells before rules were applied")
        
        var numberlivingafterrules = 0
        
        for column in 0..<10
        {
            for row in 0..<10
            {
                if(array[column][row] == true)
                {
                    switch(countNeighbors(column,row: row, array: array))
                    {
                        case 2,3: numberlivingafterrules += 1
                        default: numberlivingafterrules += 0
                    }
                }
            }
        }
        print("There are \(numberlivingafterrules) living cells after rules were applied")
        return array
    }
    
    
    func countNeighbors(column: Int, row: Int, array:[[Bool]]) -> Int
    {
        var neighborcount = 0
        for i in column-1...column+1
        {
            if(i >= 0 && i >= array.count)
            {
                for j in row-1...row+1
                {
                    if(j >= 0 && j < 10)
                    {
                        neighborcount += 1
                    }
                }
            }
        }
        return neighborcount
    }
    

}

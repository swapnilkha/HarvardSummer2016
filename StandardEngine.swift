//
//  StandardEngine.swift
//  FinalProject
//
//  Created by Swapnil Kha on 7/28/16.
//  Copyright © 2016 Swapnil Kha. All rights reserved.
//


import Foundation
class StandardEngine
{

    static var _sharedInstance: StandardEngine = StandardEngine(20,20)
    static var sharedInstance: StandardEngine { get { return _sharedInstance } }
    
    var grid: GridProtocol
    
    var rows: Int
    {
        didSet
        {
            if delegate != nil { delegate!.engineDidUpdate(grid) }
        }
    }
    
    var cols: Int
    {
        didSet
        {
            if delegate != nil { delegate!.engineDidUpdate(grid) }
        }
    }
    
    weak var delegate: EngineDelegate?
    
    var refreshRate:  Double = 0.0
    var refreshTimer: NSTimer?
    
    
    subscript (i:Int, j:Int) -> CellState
    {
        get { return grid.cellstate[i][j] }
        set { grid.cellstate[i][j] == newValue }
    }
    
    
    init(_ rows: Int, _ cols: Int)
    {
        self.rows = rows
        self.cols = cols
        self.grid = Grid(rows: rows,cols: cols)
    }
    
    func step() -> GridProtocol
    {
        var newGrid = Grid(rows: self.rows, cols: self.cols)
        let i = newGrid.rows
        let j = newGrid.cols
        
        switch newGrid.livingNeighbors((i,j))
        {
            case 2,3 :  return newGrid.cellstate[i][j].Alive
            case 3: return newGrid.cellstate[i][j].Born
            default: return newGrid.cellstate[i][j].Empty
        }
    } 
    
    var refreshInterval: NSTimeInterval = 0
    {
        didSet
        {
            if refreshInterval != 0
            {
                if refreshTimer != nil { refreshTimer!.invalidate() }
                let sel = #selector(StandardEngine.timerDidFire(_:))
                refreshTimer = NSTimer.scheduledTimerWithTimeInterval(refreshInterval, target: self, selector: sel, userInfo: ["grid": grid as! SimulationViewController], repeats: true)
            }
            else if let timer = refreshTimer
            {
                timer.invalidate()
                self.refreshTimer = nil
            }
        }
    }
    
    @objc func timerDidFire(timer:NSTimer)
    {
        let center = NSNotificationCenter.defaultCenter()
        let n = NSNotification(name: "ExampleNotification",
                               object: nil,
                               userInfo: ["grid": grid as! SimulationViewController])
        center.postNotification(n)
        print ("\(timer.userInfo?["grid"])")
    }
    
}







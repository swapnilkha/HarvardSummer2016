//
//  StandardEngine.swift
//  Assignment4
//
//  Created by Swapnil Kha on 7/13/16.
//  Copyright © 2016 Swapnil Kha. All rights reserved.
//

import Foundation

class StandardEngine: EngineProtocol
{

    var delegate: EngineDelegate?
    var grid: GridProtocol!
    var refreshRate: Double
    var refreshTimer: NSTimer?
    func step() -> GridProtocol
    { return grid }
    
    required init(rows: UInt, cols: UInt)
    {
        self.rows = rows
        self.cols = cols
        refreshRate = 0.0
    }
    
    private var singleton = StandardEngine(rows: 10, cols: 10)
    static var _singleton: StandardEngine
    {
        get
        {
            return self._singleton
        }
    }
 
    func makeGrid(rows: UInt, cols: UInt) -> [[CellState]]
    {
        let grid = Grid(rows: rows, cols: cols)
        return grid.returnCellState()
    }
 
    var rows: UInt
    {
        didSet
        {
            if delegate != nil { delegate!.engineDidUpdate(grid) }
        }
    }
 
    var cols: UInt
    {
        didSet
        {
            if delegate != nil { delegate!.engineDidUpdate(grid) }
        }
    }
    
    func incrementRows() {self.rows += 10}
    func incrementCols() {self.cols += 10}
    
    var refreshInterval: NSTimeInterval = 0
    {
        didSet
        {
            if refreshInterval != 0
            {
                if refreshTimer != nil { refreshTimer!.invalidate() }
                let sel = #selector(StandardEngine.timerDidFire(_:))
                refreshTimer = NSTimer.scheduledTimerWithTimeInterval(refreshInterval,
                                                               target: self,
                                                               selector: sel,
                                                               userInfo: ["name": 0],
                                                               repeats: true)
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
        self.rows += 10
        let center = NSNotificationCenter.defaultCenter()
        let n = NSNotification(name: "ExampleNotification",
                               object: nil,
                               userInfo: ["name": 1])
        center.postNotification(n)
        print ("\(timer.userInfo?["name"])")
    }
    
    
}
 
 
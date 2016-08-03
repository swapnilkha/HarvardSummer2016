//
//  EngineProtocol.swift
//  FinalProject
//
//  Created by Swapnil Kha on 7/28/16.
//  Copyright © 2016 Swapnil Kha. All rights reserved.
//

import Foundation

protocol EngineProtocol
{
    var rows: Int { get set }
    var cols: Int { get set }
    var grid: GridProtocol { get }
    var delegate: EngineDelegate? { get set }
    var refreshRate:  Double { get set }
    var refreshTimer: NSTimer? { get set }
    func step() -> GridProtocol
}
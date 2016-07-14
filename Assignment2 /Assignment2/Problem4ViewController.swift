//
//  Problem4ViewController.swift
//  Assignment2
//
//  Created by Swapnil Kha on 6/30/16.
//  Copyright © 2016 Swapnil Kha. All rights reserved.
//

import UIKit

class Problem4ViewController: UIViewController
{
    var problem4gridarray: [[Bool]] = []
    @IBAction func Button(sender: AnyObject)
    {
        for column in 0..<10
        {
            for row in 0..<10
            {
                if arc4random_uniform(3) == 1
                {
                    problem4gridarray[column][row] = true
                }
            }
        }
        
        for column in 0..<10
        {
            for row in 0..<10
            {
                if(problem4gridarray[column][row] == true)
                {
                    switch(countNeighbors(column,row: row))
                    {
                    case 2,3: problem4gridarray[column][row] = true
                    default: problem4gridarray[column][row] = false
                    }
                }
            }
        }
        step2()
    }
    
    func step2()
    {
        for column in 0..<10
        {
            for row in 0..<10
            {
                print (neighbors(column,row: row))
            }
        }
    }
    
    func countNeighbors(column: Int, row: Int) -> Int
    {
        var neighborcount = 0
        if(problem4gridarray[column][row]) == true
        {
            for i in column-1...column+1
            {
                if(i >= 0 && i >= problem4gridarray.count)
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
        }
        return neighborcount
    }
    
    
    func neighbors(column: Int, row: Int) -> [(column: Int, row: Int)]
    {
        var neighborcount:[(column: Int, row: Int)] = []
        if(problem4gridarray[column][row] == true)
        {
            for i in column-1...column+1
            {
                if(i >= 0 && i >= problem4gridarray.count)
                {
                    for j in row-1...row+1
                    {
                        if(j >= 0 && j < problem4gridarray[i].count)
                        {
                            neighborcount += [(column: column, row: row)]
                        }
                    }
                }
            }
        }
        return neighborcount
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Problem4ViewController"
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

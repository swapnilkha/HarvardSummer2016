//
//  Problem2ViewController.swift
//  Assignment2
//
//  Created by Swapnil Kha on 6/30/16.
//  Copyright © 2016 Swapnil Kha. All rights reserved.
//

import UIKit

class Problem2ViewController: UIViewController
{
    var gridarray: [[Bool]] = []
    @IBAction func Button(sender: AnyObject)
    {
        for _ in 0..<10
        {
            gridarray.append(Array(count:10, repeatedValue:Bool()))
        }
        var numberliving = 0
        for column in 0..<10
        {
            for row in 0..<10
            {
                if arc4random_uniform(3) == 1
                {
                    gridarray[column][row] = true
                    numberliving+=1
                }
            }
        }
        
        print("There are \(numberliving) cells before rules were applied")
        
        var numberlivingafterrules = 0
        
        for column in 0..<10
        {
            for row in 0..<10
            {
                if(gridarray[column][row] == true)
                {
                    switch(countNeighbors(column,row: row))
                    {
                        case 2,3: numberlivingafterrules += 1
                        default:
                            numberlivingafterrules += 0
                            gridarray[column][row] = false
                    }
                }
            }
        }
        print("There are \(numberlivingafterrules) live neighbors after rules were applied")
        
        var numbercellsalive = 0
        for column in 0..<10
        {
            for row in 0..<10
            {
                if(gridarray[column][row] == true) {numbercellsalive += 1}
            }
        }
        print("There are \(numbercellsalive) cells alive after rules applied")
    }

    
    func countNeighbors(column: Int, row: Int) -> Int
    {
        var neighborcount = 0
        if(gridarray[column][row]) == true
        {
            for i in column-1...column+1
            {
                if(i >= 0 && i >= gridarray.count)
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
    

    
    @IBOutlet weak var text: UITextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Problem2ViewController"
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



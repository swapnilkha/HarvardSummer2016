//
//  Problem3ViewController.swift
//  Assignment2
//
//  Created by Swapnil Kha on 6/30/16.
//  Copyright © 2016 Swapnil Kha. All rights reserved.
//

import UIKit

class Problem3ViewController: UIViewController
{
    var problem3array: [[Bool]] = []
    @IBAction func Button(sender: AnyObject) {
        let E = Engine()
        for _ in 0..<10
        {
            problem3array.append(Array(count:10, repeatedValue:Bool()))
        }
        var numberliving = 0
        for column in 0..<10
        {
            for row in 0..<10
            {
                if arc4random_uniform(3) == 1
                {
                    problem3array[column][row] = true
                    numberliving+=1
                }
            }
        }
        print(E.step(problem3array, numberliving: numberliving))
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Problem3ViewController"
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}




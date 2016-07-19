//
//  SecondViewController.swift
//  Assignment4
//
//  Created by Swapnil Kha on 7/12/16.
//  Copyright © 2016 Swapnil Kha. All rights reserved.
//

import UIKit

class SimulationViewController: UIViewController, EngineDelegate {

 @IBAction func step(sender: AnyObject)
    {
        
        

 
    }
    var engineprotocol: EngineProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func engineDidUpdate(withGrid: GridProtocol) {}

}


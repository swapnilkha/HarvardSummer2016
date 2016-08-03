//
//  SecondViewController.swift
//  FinalProject
//
//  Created by Swapnil Kha on 7/28/16.
//  Copyright © 2016 Swapnil Kha. All rights reserved.
//

import UIKit
import Foundation

class SimulationViewController: UIViewController {
    
    func watchForNotifications(notification:NSNotification) {
        let value = notification.userInfo!["name"]
        if let value1 = value {
            print(value1)
        }
    }
    
    @IBAction func step(sender: AnyObject)
    {
       let S = StandardEngine.sharedInstance
       S.step()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

    
    
    
    
    
    



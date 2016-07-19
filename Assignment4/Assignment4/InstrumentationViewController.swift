//
//  InstrumentationViewController.swift
//  Lecture6
//
//  Created by Van Simmons on 7/11/16.
//  Copyright © 2016 S65g. All rights reserved.
//

import UIKit

class InstrumentationViewController: UIViewController {
    
   let SE = StandardEngine(rows: 10, cols: 10)
    @IBOutlet weak var rows: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        let sel = #selector(InstrumentationViewController.watchForNotifications(_:))
        let center  = NSNotificationCenter.defaultCenter()
        center.addObserver(self, selector: sel, name: "ExampleNotification", object: nil)
    }
    
    func watchForNotifications(notification:NSNotification) {
        let value = notification.userInfo!["name"]
        if let value2 = value {
            print(value2)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func increment(sender: AnyObject) {
        SE.incrementRows()
    }
    
    @IBAction func updateTimeInterval(sender: UITextField) {
        if let text = sender.text,
            interval = Double(text)  {
            SE.refreshInterval = interval
        }
        else  {
            SE.refreshInterval = 0
        }
    }
}
 
 
 
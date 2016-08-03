//
//  FirstViewController.swift
//  FinalProject
//
//  Created by Swapnil Kha on 7/28/16.
//  Copyright © 2016 Swapnil Kha. All rights reserved.
//

import UIKit

class InstrumentationViewController: UIViewController {

    
    @IBOutlet weak var text: UITextView!
    
    let S = StandardEngine.sharedInstance
    
    @IBAction func incRows(sender: AnyObject)
    { S.rows += 10 }
    
    @IBAction func incCols(sender: AnyObject)
    { S.cols += 10 }
    
    @IBAction func incRefresh(sender: AnyObject)
    { S.refreshRate += 10 }
    
    @IBAction func fetch(sender: AnyObject) {
        let url = NSURL(string: "https://dl.dropboxusercontent.com/u/7544475/S65g.json")!
        let fetcher = Fetcher()
        fetcher.requestJSON(url) { (json, message) in
            let op = NSBlockOperation {
                if let json = json {
                    self.text.text = json.description
                }
                else if let message = message {
                    self.text.text = message
                }
                else {
                    self.text.text = "Error!"
                }
            }
            NSOperationQueue.mainQueue().addOperation(op)
        }
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


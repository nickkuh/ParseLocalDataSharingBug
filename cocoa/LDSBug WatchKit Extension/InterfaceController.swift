//
//  InterfaceController.swift
//  LDSBug WatchKit Extension
//
//  Created by Nick Kuh on 08/05/2015.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    
    var sharedObject:PFObject!

    override func willActivate() {
        super.willActivate()
        
        reloadDataAndRefreshLabel()
    }
    
    @IBOutlet weak var label: WKInterfaceLabel!
    
    func refreshLabel () {
        if let o = sharedObject {
            let v = o["myProp"] as! Double
            
            label.setText("\(v)")
        }
    }
    
    func reloadDataAndRefreshLabel () {
        if let o = sharedObject {
            o.fetchFromLocalDatastoreInBackgroundWithBlock({(object, error) -> Void in
                if object != nil {
                    println("Fetched: \(object)")
                    self.refreshLabel()
                }
                delay(1, { () -> () in
                    self.reloadDataAndRefreshLabel()
                })

            })
        }
        else {
            DataModel.sharedInstance.getLocalSharedObject({ (object) -> Void in
                if object != nil {
                    println("getLocalSharedObject: \(object)")
                    self.sharedObject = object
                    self.refreshLabel()
                }
                delay(1, { () -> () in
                    self.reloadDataAndRefreshLabel()
                })

            })
        }
    }
    
}

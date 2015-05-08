//
//  DataModel.swift
//  ParseStarterProject
//
//  Created by Nick Kuh on 08/05/2015.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import WatchKit
import Foundation

public class DataModel {
    public class var sharedInstance: DataModel {
        struct Singleton {
            static let sharedInstance = DataModel()
        }
        
        return Singleton.sharedInstance
        
    }
    
    init() {
        println("Setting up Parse!")
        
        Parse.enableLocalDatastore()
        
        Parse.enableDataSharingWithApplicationGroupIdentifier("group.com.nickkuh.lds", containingApplication: "com.nickkuh.lds")
        
        var appID = ""
        var clientKey = ""
        
        assert( !appID.isEmpty && !clientKey.isEmpty, "Please fill in Parse App ID and Client Key" );
        
        Parse.setApplicationId(appID,clientKey: clientKey)
        

    }
    
    
    func getLocalSharedObject (completion:(PFObject?)->Void) {
        var query = PFQuery(className:"SharedObject")
        query.fromLocalDatastore()
        query.getFirstObjectInBackgroundWithBlock { (obj, error) -> Void in
            completion(obj)
        }
    }

}
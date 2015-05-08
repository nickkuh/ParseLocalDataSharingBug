//
//  Delay.swift
//  Glued
//
//  Created by Nick Kuh on 20/03/2015.
//  Copyright (c) 2015 Mumbo Apps Ltd. All rights reserved.
//

import Foundation


func delay(delay:Double, closure:()->()) {
    
    let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
    let q = dispatch_get_main_queue()
    
    
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        q, closure)
    
    
}
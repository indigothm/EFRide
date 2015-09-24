//
//  Ride.swift
//  EFRideSharing
//
//  Created by Ilia Tikhomirov on 23/09/15.
//  Copyright (c) 2015 Ilia Tikhomirov. All rights reserved.
//

import Foundation

class Ride {
    
    var to: String?
    var from: String?
    var time: String?
    
    init (to: String, from: String, time: String) {
        self.to = to
        self.from = from
        self.time = time
    }
    
}
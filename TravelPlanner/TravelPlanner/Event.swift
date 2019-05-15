//
//  Event.swift
//  TravelPlanner
//
//  Created by Junwei Liang on 5/14/19.
//  Copyright © 2019 Junwei Liang. All rights reserved.
//

import UIKit

class Event {
    let description: String
    let location: String
    let time: String
    let cost: Double
    var check: Bool
    
    init(description: String, location: String, time: String, cost: Double, check: Bool) {
        self.description = description
        self.location = location
        self.time = time
        self.cost = cost
        self.check = check
    }
}

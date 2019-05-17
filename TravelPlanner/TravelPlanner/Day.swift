//
//  Day.swift
//  TravelPlanner
//
//  Created by Junwei Liang on 5/12/19.
//  Copyright © 2019 Junwei Liang. All rights reserved.
//

import UIKit
//day class
class Day: Codable {
    var dayNum: UInt32
    var events: [Event] = []
    
    init(dayNum: UInt32, events: [Event]) {
        self.dayNum = dayNum
        self.events = events
    }
}

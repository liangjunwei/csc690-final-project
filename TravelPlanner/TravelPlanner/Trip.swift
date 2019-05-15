//
//  Trip.swift
//  TravelPlanner
//
//  Created by Junwei Liang on 5/12/19.
//  Copyright © 2019 Junwei Liang. All rights reserved.
//

import UIKit

class Trip {
    let title: String
    var days: [Day] = []
    let budget: Double
    
    init(title: String, days: [Day], budget: Double) {
        self.title = title
        self.days = days
        self.budget = budget
    }
}

//
//  EventDetails.swift
//  TravelPlanner
//
//  Created by Junwei Liang on 5/15/19.
//  Copyright © 2019 Junwei Liang. All rights reserved.
//

import UIKit
//this is the home page
class EventDetails: UIViewController {
    
    @IBAction func checkEvent(_ sender: Any) {
        tripStorage.tripArray[tripIndex].days[dayIndex].events[eventIndex].check = true
    }
    
}

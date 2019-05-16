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
    
    @IBOutlet weak var descriptionDetails: UILabel!
    @IBOutlet weak var locationDetails: UILabel!
    @IBOutlet weak var timeDetails: UILabel!
    @IBOutlet weak var costDetails: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionDetails.text = tripStorage.tripArray[tripIndex].days[dayIndex].events[eventIndex].description
        locationDetails.text = tripStorage.tripArray[tripIndex].days[dayIndex].events[eventIndex].location
        timeDetails.text = tripStorage.tripArray[tripIndex].days[dayIndex].events[eventIndex].time
        costDetails.text = "$" + String(tripStorage.tripArray[tripIndex].days[dayIndex].events[eventIndex].cost)
    }
    
    @IBAction func checkEvent(_ sender: Any) {
        tripStorage.tripArray[tripIndex].days[dayIndex].events[eventIndex].check = true
    }
    
}

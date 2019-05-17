//
//  EventDetails.swift
//  TravelPlanner
//
//  Created by Junwei Liang on 5/15/19.
//  Copyright © 2019 Junwei Liang. All rights reserved.
//

import UIKit
//shows the details of event
class EventDetails: UIViewController {
    
    @IBOutlet weak var descriptionDetails: UILabel!
    @IBOutlet weak var locationDetails: UILabel!
    @IBOutlet weak var timeDetails: UILabel!
    @IBOutlet weak var costDetails: UILabel!
    
    var store = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //all the details
        descriptionDetails.text = tripStorage.tripArray[tripIndex].days[dayIndex].events[eventIndex].description
        locationDetails.text = tripStorage.tripArray[tripIndex].days[dayIndex].events[eventIndex].location
        timeDetails.text = tripStorage.tripArray[tripIndex].days[dayIndex].events[eventIndex].time
        costDetails.text = "$" + String(tripStorage.tripArray[tripIndex].days[dayIndex].events[eventIndex].cost)
    }
    
    //when this button is clicked, change check to true, and the color of the text label will be green in event list
    @IBAction func checkEvent(_ sender: Any) {
        tripStorage.tripArray[tripIndex].days[dayIndex].events[eventIndex].check = true
        
        //encode data after check event
        let encoder = JSONEncoder()
        
        if let tripData = try? encoder.encode(tripStorage.tripArray) {
            self.store.set(tripData, forKey: "trips")
        }
    }
    
}

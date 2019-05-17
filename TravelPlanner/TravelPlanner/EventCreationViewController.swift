//
//  EventCreationViewController.swift
//  TravelPlanner
//
//  Created by Junwei Liang on 5/12/19.
//  Copyright © 2019 Junwei Liang. All rights reserved.
//

import UIKit
//read input from text field and create event when button is clicked
class EventCreationViewController: UIViewController {
    
    @IBOutlet weak var eventDescription: UITextField!
    @IBOutlet weak var eventLocation: UITextField!
    @IBOutlet weak var eventTime: UITextField!
    @IBOutlet weak var eventCost: UITextField!
    
    var store = UserDefaults.standard
    
    @IBAction func createEvent(_ sender: Any) {
        //check inputs
        guard
            let description = eventDescription.text,
            !description.isEmpty,
            let location = eventLocation.text,
            !location.isEmpty,
            let time = eventTime.text,
            !time.isEmpty,
            let cost = eventCost.text,
            !cost.isEmpty,
            let costOfEvent = Double(cost),
            costOfEvent >= 0.0
        else {
                return
        }
        print(costOfEvent)
        
        //create new event
        let newEvent = Event(description: description, location: location, time: time, cost: costOfEvent, check: false)
        
        tripStorage.tripArray[tripIndex].days[dayIndex].events.append(newEvent)
        
        //encode data after event creation
        let encoder = JSONEncoder()
        
        if let tripData = try? encoder.encode(tripStorage.tripArray) {
            self.store.set(tripData, forKey: "trips")
        }
        
        dismiss(animated: true, completion: {print("dismissed!")})
    }
}

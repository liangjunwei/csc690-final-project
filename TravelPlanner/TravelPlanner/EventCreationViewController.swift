//
//  EventCreationViewController.swift
//  TravelPlanner
//
//  Created by Junwei Liang on 5/12/19.
//  Copyright © 2019 Junwei Liang. All rights reserved.
//

import UIKit

class EventCreationViewController: UIViewController {
    
    @IBOutlet weak var eventDescription: UITextField!
    @IBOutlet weak var eventLocation: UITextField!
    @IBOutlet weak var eventTime: UITextField!
    @IBOutlet weak var eventCost: UITextField!
    
    @IBAction func createEvent(_ sender: Any) {
        guard
            let description = eventDescription.text,
            !description.isEmpty,
            let location = eventLocation.text,
            !location.isEmpty,
            let time = eventTime.text,
            !time.isEmpty,
            let cost = eventCost.text,
            !cost.isEmpty,
            let costOfEvent = Double(cost)
        else {
                return
        }
        print(costOfEvent)
        
        let newEvent = Event(description: description, location: location, time: time, cost: costOfEvent, check: false)
        
        tripStorage.tripArray[tripIndex].days[dayIndex].events.append(newEvent)
        
        dismiss(animated: true, completion: {print("dismissed!")})
    }
}

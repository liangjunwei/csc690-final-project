//
//  TripCreationViewController.swift
//  TravelPlanner
//
//  Created by Junwei Liang on 5/12/19.
//  Copyright © 2019 Junwei Liang. All rights reserved.
//

import UIKit
//read the input from text field and create trip when the button is clicked
class TripCreationViewController: UIViewController {
    
    @IBOutlet weak var tripTitle: UITextField!
    @IBOutlet weak var tripDays: UITextField!
    @IBOutlet weak var tripBudget: UITextField!
    
    
    
    var tripStorage: TripStoring = TripStorage.shared
    var daysArray: [Day] = []
    var eventsArray: [Event] = []
    
    @IBAction func createTrip(_ sender: Any) {
        guard
            let title = tripTitle.text,
            !title.isEmpty,
            let days = tripDays.text,
            !days.isEmpty,
            let numOfDays = UInt32(days),
            let budget = tripBudget.text,
            !budget.isEmpty,
            let budgetOfTrip = Double(budget)
        else {
            return
        }
        
        for dayindex in 1...numOfDays {
            let newday = Day(dayNum: dayindex, events: eventsArray)
            daysArray.append(newday)
            print("inserted: \(dayindex)")
        }
        
        print(daysArray[0].dayNum)
        
        let trip = Trip(title: title, days: daysArray, budget: budgetOfTrip)
        tripStorage.insert(trip: trip)
        print("insert everything!")
        dismiss(animated: true, completion: {print("dismissed!")})
    }
    
}

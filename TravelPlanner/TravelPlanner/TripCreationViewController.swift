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
    var store = UserDefaults.standard
    
    @IBAction func createTrip(_ sender: Any) {
        //check inputs
        guard
            let title = tripTitle.text,
            !title.isEmpty,
            let days = tripDays.text,
            !days.isEmpty,
            let numOfDays = UInt32(days),
            numOfDays >= 1,
            let budget = tripBudget.text,
            !budget.isEmpty,
            let budgetOfTrip = Double(budget),
            budgetOfTrip >= 0
        else {
            return
        }
        
        //create the day array
        for dayindex in 1...numOfDays {
            let newday = Day(dayNum: dayindex, events: eventsArray)
            daysArray.append(newday)
            print("inserted: \(dayindex)")
        }
        
        print(daysArray[0].dayNum)
        
        //create the trip
        let trip = Trip(title: title, days: daysArray, budget: budgetOfTrip)
        tripStorage.insert(trip: trip)
        print("insert everything!")
        
        //encode the data after trip creation
        let encoder = JSONEncoder()
        
        if let tripData = try? encoder.encode(self.tripStorage.tripArray) {
            self.store.set(tripData, forKey: "trips")
        }
        
        dismiss(animated: true, completion: {print("dismissed!")})
    }
    
}

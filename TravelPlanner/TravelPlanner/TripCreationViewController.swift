//
//  TripCreationViewController.swift
//  TravelPlanner
//
//  Created by Junwei Liang on 5/12/19.
//  Copyright © 2019 Junwei Liang. All rights reserved.
//

import UIKit

class TripCreationViewController: UIViewController {
    
    @IBOutlet weak var tripTitle: UITextField!
    
    var tripStorage: TripStoring = TripStorage.shared
    
    @IBAction func createTrip(_ sender: Any) {
        guard
            let title = tripTitle.text,
            !title.isEmpty
        else {
            return
        }
        
        let trip = Trip(title: title)
        tripStorage.insert(trip: trip)
        dismiss(animated: true, completion: {print("dismissed!")})
    }
    
}

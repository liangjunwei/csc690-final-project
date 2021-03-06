//
//  ViewController.swift
//  TravelPlanner
//
//  Created by Junwei Liang on 5/5/19.
//  Copyright © 2019 Junwei Liang. All rights reserved.
//

import UIKit

//this index knows which trip
var tripIndex = 0
//make trip storage global
var tripStorage: TripStoring = TripStorage.shared

//this class display all the trip titles and budget of the trip in table view
class TripListTableViewController: UITableViewController {
    
//    var tripStorage: TripStoring = TripStorage.shared
    var store = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //decode the data
        let decoder = JSONDecoder()
        
        if
            let storedTripsData = store.data(forKey: "trips"),
            let trips = try? decoder.decode(Array<Trip>.self, from: storedTripsData)
        {
            tripStorage.tripArray = trips
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripStorage.tripArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "TripCell") as? TripCell
        else {
            return UITableViewCell()
        }
        
        //assign the trip title and budget of the trip to cell
        cell.textLabel?.text = tripStorage.tripArray[indexPath.row].title
        cell.budgetLabel?.text = "Budget: $" + String(tripStorage.tripArray[indexPath.row].budget)
        
        var totalCost = 0.0
        
        //calculate the total cost
        if tripStorage.tripArray[indexPath.row].days.count >= 1 {
            for i in 0...(tripStorage.tripArray[indexPath.row].days.count - 1) {
                if tripStorage.tripArray[indexPath.row].days[i].events.count >= 1 {
                    for k in 0...(tripStorage.tripArray[indexPath.row].days[i].events.count - 1) {
                        totalCost += tripStorage.tripArray[indexPath.row].days[i].events[k].cost
                    }
                }
            }
        }
        
        //total cost of the trip
        cell.totalCost?.text = "Total Cost: $" + String(totalCost)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //delete a trip
        if editingStyle == UITableViewCell.EditingStyle.delete {
            tripStorage.tripArray.remove(at: indexPath.row)
        }
        
        //encode data after delete
        let encoder = JSONEncoder()
        
        if let tripData = try? encoder.encode(tripStorage.tripArray) {
            self.store.set(tripData, forKey: "trips")
        }
        //reload data
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("trip row: \(indexPath.row)")
        tripIndex = indexPath.row
        //segue for trip cell
        performSegue(withIdentifier: "tripToDays", sender: self)
    }
}


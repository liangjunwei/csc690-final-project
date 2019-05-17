//
//  DayListTableViewController.swift
//  TravelPlanner
//
//  Created by Junwei Liang on 5/12/19.
//  Copyright © 2019 Junwei Liang. All rights reserved.
//

import UIKit
//this index knows which day
var dayIndex = 0;

//this class will shows all the days in table view
class DayListTableViewController: UITableViewController {

    var store = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripStorage.tripArray[tripIndex].days.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell") as? DayCell
        else {
            return UITableViewCell()
        }
        cell.textLabel?.text = "Day " + String(tripStorage.tripArray[tripIndex].days[indexPath.row].dayNum)
        
        var totalCostOfTheDay = 0.0
        
        //calculate cost of the day
        if tripStorage.tripArray[tripIndex].days[indexPath.row].events.count > 0 {
            for eventArrayIndex in 0...(tripStorage.tripArray[tripIndex].days[indexPath.row].events.count - 1) {
                totalCostOfTheDay += tripStorage.tripArray[tripIndex].days[indexPath.row].events[eventArrayIndex].cost
            }
        }
        //total cost of the day
        cell.costOfTheDay?.text = "Cost: $" + String(totalCostOfTheDay)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //delete a day
        if editingStyle == UITableViewCell.EditingStyle.delete {
            tripStorage.tripArray[tripIndex].days.remove(at: indexPath.row)
        }
        //number of the day changes
        if indexPath.row <= (tripStorage.tripArray[tripIndex].days.count - 1) {
            for newdayIndex in indexPath.row...(tripStorage.tripArray[tripIndex].days.count - 1) {
                tripStorage.tripArray[tripIndex].days[newdayIndex].dayNum -= 1
            }
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
        print("day row: \(indexPath.row)")
        dayIndex = indexPath.row
        //segue for day cell
        performSegue(withIdentifier: "dayToEvents", sender: self)
    }
}

//
//  EventListTableViewController.swift
//  TravelPlanner
//
//  Created by Junwei Liang on 5/14/19.
//  Copyright © 2019 Junwei Liang. All rights reserved.
//

import UIKit

var eventIndex = 0

class EventListTableViewController: UITableViewController {
    
    var store = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripStorage.tripArray[tripIndex].days[dayIndex].events.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell") as? EventCell
            else {
                return UITableViewCell()
        }
        cell.textLabel?.text = tripStorage.tripArray[tripIndex].days[dayIndex].events[indexPath.row].description
        cell.eventCost?.text = "Cost: $" + String(tripStorage.tripArray[tripIndex].days[dayIndex].events[indexPath.row].cost)
        
        if tripStorage.tripArray[tripIndex].days[dayIndex].events[indexPath.row].check {
            cell.textLabel?.textColor = UIColor.green
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            tripStorage.tripArray[tripIndex].days[dayIndex].events.remove(at: indexPath.row)
        }
        
        let encoder = JSONEncoder()
        
        if let tripData = try? encoder.encode(tripStorage.tripArray) {
            self.store.set(tripData, forKey: "trips")
        }
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("event row: \(indexPath.row)")
        eventIndex = indexPath.row
        performSegue(withIdentifier: "eventDetails", sender: self)
    }
}

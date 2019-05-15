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
        
        if tripStorage.tripArray[tripIndex].days[dayIndex].events[indexPath.row].check {
            cell.textLabel?.textColor = UIColor.green
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("event row: \(indexPath.row)")
        eventIndex = indexPath.row
        performSegue(withIdentifier: "eventDetails", sender: self)
    }
}

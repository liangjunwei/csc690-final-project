//
//  ViewController.swift
//  TravelPlanner
//
//  Created by Junwei Liang on 5/5/19.
//  Copyright © 2019 Junwei Liang. All rights reserved.
//

import UIKit

//this index knows which trip
var tripIndex = 0;
//make trip storage global
var tripStorage: TripStoring = TripStorage.shared

//this class display all the trip titles in table view
class TripListTableViewController: UITableViewController {
    
//    var tripStorage: TripStoring = TripStorage.shared
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
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
        cell.textLabel?.text = tripStorage.tripArray[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("trip row: \(indexPath.row)")
        tripIndex = indexPath.row
        performSegue(withIdentifier: "tripToDays", sender: self)
    }
}


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
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    
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
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("day row: \(indexPath.row)")
        dayIndex = indexPath.row
        performSegue(withIdentifier: "dayToEvents", sender: self)
    }
}

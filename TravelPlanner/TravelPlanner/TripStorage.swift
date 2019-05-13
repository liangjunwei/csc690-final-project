//
//  TripStorage.swift
//  TravelPlanner
//
//  Created by Junwei Liang on 5/12/19.
//  Copyright © 2019 Junwei Liang. All rights reserved.
//

import Foundation
//this class store information about trips
protocol TripStoring {
    var tripArray: [Trip] { get }
    func insert(trip: Trip)
}

class TripStorage: TripStoring {
    
    static let shared = TripStorage()
    
    private init() { }
    
    private(set) var tripArray: [Trip] = []
    
    func insert(trip: Trip) {
        tripArray.append(trip)
    }
}

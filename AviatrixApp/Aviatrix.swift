//
//  Aviatrix.swift
//  AviatrixApp
//
//  Created by Amy Holt on 6/10/18.
//  Copyright © 2018 Amy Holt. All rights reserved.
//

import Foundation

class Aviatrix {
    
    var running = false //Step 1: declare/change running to false
    var author : String // Step 2: Add pilot name and initialize
    let maxFuel = 5000.0
    var fuelLevel = 5000.0
    var milesPerGallon = 0.4
    var fuelCost = 0.0
    var distanceTraveled = 0
    var location = "St. Louis" // Step 7: new variable location
    var data = AviatrixData()
    
    
    init(author:String){
        self.author = author
    }
    
    func start() -> Bool {
        running = true
        return running
    }
    
    func refuel() -> Double {
        let refuelAmount = Double(maxFuel) - fuelLevel
        fuelLevel = Double(maxFuel)
        return refuelAmount
    }
    
    func flyTo(destination : String) {
        // add to distance travelled, fuel level
        distanceTraveled += distanceTo(start: location, target: destination)
        fuelLevel -= Double(distanceTraveled)*milesPerGallon
        
        //store the location in func
        location = destination
        milesPerGallon = 0.55 - (fuelLevel)*(0.00005)
    }
    
    func distanceTo(start: String, target: String) -> Int {
        // Step 6: add known distance
        return data.knownDistances[start]![target]!
    }
    
    func knownDestinations() -> [String] {
        // STEP 5: CHANGE KNOWN DESTINATIONS
        return ["St. Louis", "Phoenix", "Denver", "SLC"]
    }
}

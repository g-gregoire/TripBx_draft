//
//  TripModel.swift
//  TripBx_draft
//
//  Created by Georges Gregoire on 2022-09-09.
//

import Foundation

class TripModel: ObservableObject, Identifiable {
    
    // List of Squads
    @Published var squads = [Squad]()
    
    // Current Squad
    @Published var currentSquad: Squad?
    var currentSquadIndex = 0
    @Published var currentSquadSelected:Int?
    
    
    // List of Trips
    @Published var trips = [Trip]()
    
    // Current Trip
    @Published var currentTrip: Trip?
    var currentTripIndex = 0
    @Published var currentTripSelected:Int?
    
    init() {
        
        // Parse local included json data
        getLocalData()
        
    }
    
    // MARK: - Data methods
    
    func getLocalData() {
        
        // Get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            // Read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // Try to decode the json into an array of modules
            let jsonDecoder = JSONDecoder()
            let squads = try jsonDecoder.decode([Squad].self, from: jsonData)
            
            // Assign parsed modules to modules property
            self.squads = squads
        }
        catch {
            // TODO log error
            print("Couldn't parse local data")
        }
    }
    
    
    // MARK: - Squad navigation methods
    
    func openSquad(_ squadID:Int) {
        
        // Find the index for this module id
        for index in 0..<squads.count {
            
            if squads[index].id == squadID {
            
                // Found the matching module
                currentSquadIndex = index
                break
            }
        }
        
        // Set the current module
        currentSquad = squads[currentSquadIndex]
    }
    
    func openTrip(_ squadID:Int, _ tripID:Int) {
        
        // Find the index for this module id
        for index in 0..<squads[squadID].trips!.count {
            
            if squads[squadID].trips![index].id == tripID {
            
                // Found the matching module
                currentTripIndex = index
                break
            }
        }
        
        // Set the current module
        currentTrip = squads[squadID].trips![currentTripIndex]
    }
}

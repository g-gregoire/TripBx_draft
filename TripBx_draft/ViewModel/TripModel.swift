//
//  TripModel.swift
//  TripBx_draft
//
//  Created by Georges Gregoire on 2022-09-09.
//

import Foundation
import SwiftUI

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
    
    @Published var imageData: Data?
    @Published var images = [Photo]()
    @Published var imagesData = [Data?]()
    
    init() {
        
        // Parse local included json data
        getLocalData()
//        getImageData()
        
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
    
    func getImageData() {
        
        // Get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "photos", withExtension: "json")
        
        do {
            // Read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // Try to decode the json into an array of modules
            let jsonDecoder = JSONDecoder()
            let imagesJSON = try jsonDecoder.decode([Photo].self, from: jsonData)
            
            // Assign parsed modules to modules property
            self.images = imagesJSON
        }
        catch {
            // TODO log error
            print("Couldn't parse local data")
        }
        
        // once decoded, pull imgae from from storage
        for image in images {
            
            let imageURL = Constants.fileStoreURL + image.path
//            let imageURL = "https://g-gregoire.github.io/tripBx_Repo/pics/2DCCFFED-F2CD-4B9F-B675-135A491D117F.JPG"

            if let url = URL(string: imageURL) {

                let session = URLSession.shared
                let dataTask = session.dataTask(with: url) { data, response, error in

                    if error == nil {
                        DispatchQueue.main.async {
                            self.imagesData += [data!]
                        }
                    }
                }
                dataTask.resume()
            }
        }
            
    }
    
//    func getRemoteData() {
//
//        let URLString = Constants.fileStoreURL
//        let URL = URL(string: URLString)
//
//        guard URL != nil else {
//            // Couldn't create url
//            return
//        }
//
//        let
//
//    }
    
    
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

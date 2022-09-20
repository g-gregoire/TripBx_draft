//
//  Models.swift
//  TripBx_draft
//
//  Created by Georges Gregoire on 2022-09-09.
//

import Foundation

struct Squad: Decodable, Identifiable {
    
    var id: Int
    var name: String
    var description: String?
    var image:String?
    var users: [User]?
    var trips: [Trip]?
    
}

struct User: Decodable, Identifiable {
    
    var id: Int
    var name: String
    
}

struct Trip: Decodable, Identifiable {
    
    var id: Int
    var name: String
    var description: String?
    var image:String?
    var albumID: Int
    var users: [User]?
    var photos: [Photo]
    
}

// May not be needed
struct Album: Decodable, Identifiable {
    
    var id: Int
    var photos: [Photo]
    
}

struct Photo: Decodable, Identifiable {
    
    var id: Int
    var path: String
//    var filename: String
//    var dateAdded: Date
//    var addedBy: User.ID
//    var tripID: Int
    
    
    
}

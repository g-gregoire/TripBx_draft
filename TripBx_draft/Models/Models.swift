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
    var users: [User]
    
}

struct User: Decodable, Identifiable {
    
    var id: Int
    var name: String
    var email: String
    
}

struct Trip: Decodable, Identifiable {
    
    var id: Int
    var name: String
    var description: String?
    var image:String?
    var squadID: Int
    
}

// May not be needed
struct Album: Decodable, Identifiable {
    
    var id: Int
    var photos: Photo.ID
    var tripID: Int
    
}

struct Photo: Decodable, Identifiable {
    
    var id: Int
    var path: String
    var filename: String
    var dateAdded: Date
    var addedBy: User.ID
    var tripID: Int
    
}
    
    
}

//
//  TripView.swift
//  TripBx_draft
//
//  Created by Georges Gregoire on 2022-09-11.
//

import SwiftUI

struct TripView: View {
    
    @EnvironmentObject var model: TripModel
    var index: Int
    
    // Create instance of trip for more concise vars
    var trip: Trip {
        
        if model.currentSquad != nil &&
            index < model.currentSquad!.trips!.count {
            return model.currentSquad!.trips![index]
        }
        else {
            return Trip(id: 0, name: "", description: "", image: "", albumID: -1, photos: [])
        }
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Image(trip.image!)
                .resizable()
                .frame(width: 95, height: 95)
                .clipShape(Circle())
            
            ScrollView {
                
                LazyVStack(spacing: 0) {
                    
                    
                    
                }
                .accentColor(.black)
                .padding()
                
                

            }
        }
        .navigationBarTitle(trip.name)
        .padding()
    }
}

struct TripView_Previews: PreviewProvider {
    static var previews: some View {
        TripView(index: 1)
    }
}

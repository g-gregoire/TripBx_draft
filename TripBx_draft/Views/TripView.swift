//
//  TripView.swift
//  TripBx_draft
//
//  Created by Georges Gregoire on 2022-09-11.
//

import SwiftUI

struct TripView: View {
    
    @EnvironmentObject var model: TripModel
    var squadIndex: Int
    var tripIndex: Int
    
    var trip: Trip {
        return model.squads[squadIndex].trips![tripIndex]
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
        TripView(squadIndex: 1, tripIndex: 1)
    }
}

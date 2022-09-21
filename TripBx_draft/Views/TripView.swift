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
            
            GeometryReader() { geometry in
            
                Image(trip.image!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
            }
            .ignoresSafeArea(.all, edges: .top)
            
            Text(trip.name)
                .font(.title)
            
            ScrollView {
                
                LazyVStack(spacing: 0) {
                    
                    AlbumView()
                    
                }
                .accentColor(.black)
                .padding()
            }
        }
    }
}

struct TripView_Previews: PreviewProvider {
    static var previews: some View {
        TripView(squadIndex: 1, tripIndex: 1)
    }
}

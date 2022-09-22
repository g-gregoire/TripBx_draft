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
        
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 0, pinnedViews:[.sectionHeaders]) {
                
                GeometryReader() { geometry in
                
                    Image(trip.image!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                }
                .frame(height: 150)
    //            .ignoresSafeArea(.all, edges: .top)
    //            .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Text(trip.name)
                        .font(Font.custom("Avenir Heavy", size: 28))
                    
                    Text("Description: \(trip.description!)")
                        .font(Font.custom("Avenir", size: 16))
                    Text("Members: \(trip.users!.count)")
                        .font(Font.custom("Avenir", size: 16))
                }
                .padding(10)
                
                Divider()
                
                HStack {
                    Spacer()
                    CircleButtonView(color: .blue, letter: "P", text: "View Photos")
                    Spacer()
                    CircleButtonView(color: .green, letter: "S", text: "View Finances")
                    Spacer()
                }
                .padding()
                
                Divider()
                
                ScrollView {
                    
                    LazyVStack(spacing: 0) {
                        AlbumView()
                    }
                    .padding()
                }
            }
            .navigationTitle(trip.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TripView_Previews: PreviewProvider {
    static var previews: some View {
        TripView(squadIndex: 1, tripIndex: 1)
    }
}

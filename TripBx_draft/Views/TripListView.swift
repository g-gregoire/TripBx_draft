//
//  TripListView.swift
//  TripBx_draft
//
//  Created by Georges Gregoire on 2022-09-14.
//

import SwiftUI

struct TripListView: View {
    
    @EnvironmentObject var model: TripModel
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
            
            Text("Here are your trips:")
                .padding(.horizontal, 20)
            
            ScrollView {
                
                LazyVStack(spacing: 0) {
                    
                    ForEach(0..<model.squads.count) { squadIndex in
                        
                        ForEach(0..<model.squads[squadIndex].trips!.count) { tripIndex in
                            
                            NavigationLink(
                                destination:
                                    TripView(squadIndex: squadIndex, tripIndex: tripIndex)
                                        .onAppear(perform: {
                                            model.openTrip(squadIndex, tripIndex)
                                            model.getImageData()
                                        }),
                                label: {
                                    TripCardView(squadIndex: squadIndex, tripIndex: tripIndex)
                                })
                        }
                    }
                    
                }
                .accentColor(.black)
                .padding(10)
                
            }
        }
            .navigationTitle("Good Day!")
        }
    }
}

struct TripListView_Previews: PreviewProvider {
    static var previews: some View {
        TripListView()
    }
}

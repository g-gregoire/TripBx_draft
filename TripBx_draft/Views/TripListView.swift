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
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Here are your trips!")
                .padding([.top, .horizontal], 20)
            
            ScrollView {
                
                LazyVStack(spacing: 0) {
                    
                    // Confirm that currentModule is set
                    if model.currentSquad != nil {
                    
                        ForEach(0..<model.squads.count) { squadIndex in
                            
                            ForEach(0..<model.squads[squadIndex].trips!.count) { tripIndex in
                                
                                
                                TripCardView(squadIndex: squadIndex, tripIndex: tripIndex)
//                                NavigationLink(
//                                    destination:
//                                        TripView(index: index)
//                                            .onAppear(perform: {
//                                                model.openTrip(model.currentSquadIndex, index)
//                                            }),
//                                    label: {
//                                        TripCardView(index: index)
//                                    })
                                
                            }
                        }
                    }
                }
                .accentColor(.black)
                .padding()
                .navigationBarTitle("\(model.currentSquad?.name ?? "")")
                

            }
        }
    }
}

struct TripListView_Previews: PreviewProvider {
    static var previews: some View {
        TripListView()
    }
}

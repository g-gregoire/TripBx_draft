//
//  TripListView.swift
//  TripBx_draft
//
//  Created by Georges Gregoire on 2022-09-14.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: TripModel
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading, spacing: 0) {
                
                Text("Good Day!")
                    .font(Font.custom("Avenir Heavy", size: 32))
                    .padding(.horizontal, 15)
                    .padding(.top, 20)
                
                
                Text("Squads:")
                    .font(Font.custom("Avenir Heavy", size: 24))
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: [GridItem(.flexible())], spacing: 5) {
                        ForEach(0..<model.squads.count) { squadIndex in
                            
                            NavigationLink(
                                destination:
                                    SquadView()
                                    .onAppear(perform: {
                                        model.openSquad(squadIndex)
                                    }),
                                tag: squadIndex,
                                selection: $model.currentSquadSelected) {
                                    // Squad Card
                                    SquadCardCircle(squadIndex: squadIndex)
                                }
                                .accentColor(.black)
                        }
                        
                        // Add Plus Button
                        AddNewSquad()
                    }
                    .padding(.horizontal, 10)
                }
                .padding(.bottom, 5)
                .frame(height: 115)
                
                Divider()
                    .padding(.horizontal, 10)
            
                Text("Trips:")
                    .font(Font.custom("Avenir Heavy", size: 24))
                    .padding(.horizontal, 15)
                    .padding(.top, 10)
                    .padding(.bottom, 5)
                
                ScrollView {
                    
                    LazyVStack(spacing: 0) {
                        
                        ForEach(0..<model.squads.count) { squadIndex in
                            
                            ForEach(0..<model.squads[squadIndex].trips!.count) { tripIndex in
                                
                                NavigationLink(
                                    destination:
                                        TripView(squadIndex: squadIndex, tripIndex: tripIndex)
                                            .onAppear(perform: {
                                                model.openTrip(squadIndex, tripIndex)
                                                if model.imagesData.count == 0 {
                                                    model.getImageData()
                                                }
                                            }),
                                    label: {
                                        TripCardView(squadIndex: squadIndex, tripIndex: tripIndex)
                                    })
                            }
                        }
                    }
                    .accentColor(.black)
                    .padding(.horizontal, 10)
                }
            }
            //.navigationTitle("Good Day!")
            .navigationBarHidden(true)
        }
    }
}

struct TripListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(TripModel())
    }
}

//
//  ContentView.swift
//  TripBx_draft
//
//  Created by Georges Gregoire on 2022-09-09.
//

import SwiftUI

struct SquadListView: View {
    
    @EnvironmentObject var model: TripModel
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                Text("Your squads are used to contain your trips.")
                    .font(Font.custom("Avenir", size: 16))
                    .padding()
                
                ScrollView {
                    
                    LazyVStack (spacing: 0) {
                    
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
                                    SquadCardView(squadIndex: squadIndex)
                                        .padding(.horizontal, 10)
                                    
                                }
                                .accentColor(.black)
                        }
                    }
                }
            }
            .navigationTitle("Squads")
        }
        .navigationViewStyle(.stack)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SquadListView()
            .environmentObject(TripModel())
    }
}

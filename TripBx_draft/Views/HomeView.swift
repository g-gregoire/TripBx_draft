//
//  ContentView.swift
//  TripBx_draft
//
//  Created by Georges Gregoire on 2022-09-09.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: TripModel
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                Text("Here are your Squads:")
                    .padding()
                
                ScrollView {
                    
                    LazyVStack (spacing: 0) {
                    
                        ForEach(model.squads) { squad in
                            
                            NavigationLink(
                                destination:
                                    SquadView()
                                    .onAppear(perform: {
                                        model.openSquad(squad.id)
                                    }),
                                tag: squad.id,
                                selection: $model.currentSquadSelected) {
                                    // Squad Card
                                    SquadCardView(name: squad.name, desc: squad.description!, image: squad.image!, memberCount: squad.users!.count)
                                        .padding(.horizontal, 10)
                                    
                                }
                                .accentColor(.black)
                            
                            
                        }
                    }
                }
                
                
            }
            .navigationTitle("Good Day!")
        }
        .navigationViewStyle(.stack)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(TripModel())
    }
}

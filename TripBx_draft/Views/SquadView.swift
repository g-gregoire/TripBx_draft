//
//  SquadView.swift
//  TripBx_draft
//
//  Created by Georges Gregoire on 2022-09-11.
//

import SwiftUI

struct SquadView: View {
    
    @EnvironmentObject var model: TripModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Here are your trips!")
                .padding([.top, .horizontal], 20)
            
            ScrollView {
                
                LazyVStack(spacing: 0) {
                    
                    // Confirm that currentModule is set
                    if model.currentSquad != nil && model.currentSquadSelected != nil  {
                        
                        let tripCount = model.squads[model.currentSquadSelected!].trips!.count
                        ForEach(0..<tripCount) { tripIndex in
                            
                            NavigationLink(
                                destination:
                                    TripView(squadIndex: model.currentSquadSelected!, tripIndex: tripIndex)
                                        .onAppear(perform: {
                                            model.openTrip(model.currentSquadSelected!, tripIndex)
                                        }),
                                label: {
                                    TripCardView(squadIndex: model.currentSquadSelected!, tripIndex: tripIndex)
                                })
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

struct SquadView_Previews: PreviewProvider {
    static var previews: some View {
        SquadView()
            .environmentObject(TripModel())
    }
}

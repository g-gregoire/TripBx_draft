//
//  TripCardView.swift
//  TripBx_draft
//
//  Created by Georges Gregoire on 2022-09-11.
//

import SwiftUI

struct TripCardView: View {
    
    @EnvironmentObject var model: TripModel
    var index: Int
    
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
        
        ZStack(alignment: .leading) {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            
            HStack {

                Image(trip.image!)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(trip.name)
                        .bold()
                    Text(trip.description!)
                        .padding(.bottom, 20)
                        .font(.caption)
                    
                    // Icons
                    HStack {
                        
                        // Number of lessons/questions
                        Image(systemName: "person.2")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text("Members: \(String(trip.users!.count))")
                            .font(Font.system(size: 10))
                        
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 20)
        }
        .padding(10)
        
    }
}

struct TripCardView_Previews: PreviewProvider {
    static var previews: some View {
        TripCardView(index: 1)
    }
}

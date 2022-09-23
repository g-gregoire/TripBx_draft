//
//  TripCardView.swift
//  TripBx_draft
//
//  Created by Georges Gregoire on 2022-09-11.
//

import SwiftUI

struct TripCardView: View {
    
    @EnvironmentObject var model: TripModel
    var squadIndex: Int
    var tripIndex: Int
    
    var trip: Trip {
        return model.squads[squadIndex].trips![tripIndex]
    }
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 90), contentMode: .fit)
            
            HStack {

                Image(trip.image!)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(trip.name)
                        .font(Font.custom("Avenir Heavy", size: 16))
                    Text(trip.description!)
                        .padding(.bottom, 5)
                        .font(Font.custom("Avenir", size: 12))
                    
                    // Icons
                    HStack {
                        // Number of lessons/questions
                        Image(systemName: "person.2")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(String(trip.users!.count))
                            .font(Font.custom("Avenir", size: 12))
                        Spacer()
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(String(model.imagesData.count))
                            .font(Font.custom("Avenir", size: 12))
                        Spacer()
                        Image(systemName: "dollarsign.square.fill")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text("$0.00")
                            .font(Font.custom("Avenir", size: 12))
                        Spacer()
                    }
                    .padding(.vertical, 5)
                }
                .frame(width: 200, height: 95, alignment: .leading)
                .padding(.leading,10)
                
                Spacer()
            }
            .padding(.horizontal, 20)
        }
        .padding(5)
        
    }
}

struct TripCardView_Previews: PreviewProvider {
    static var previews: some View {
        TripCardView(squadIndex: 1, tripIndex: 1)
    }
}

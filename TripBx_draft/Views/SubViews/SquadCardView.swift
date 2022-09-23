//
//  SquadCardView.swift
//  TripBx_draft
//
//  Created by Georges Gregoire on 2022-09-11.
//

import SwiftUI

struct SquadCardView: View {
    
    @EnvironmentObject var model: TripModel
    
    var squadIndex: Int
    
    var squad: Squad {
        return model.squads[squadIndex]
    }
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 90), contentMode: .fit)
            
            HStack {

                Image(squad.image!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(squad.name)
                        .font(Font.custom("Avenir Heavy", size: 16))
                    Text(squad.description!)
                        .padding(.bottom, 5)
                        .font(Font.custom("Avenir", size: 12))
                    
                    // Icons
                    HStack {
                        // Number of lessons/questions
                        Image(systemName: "person.2")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(String(squad.users!.count))
                            .font(Font.custom("Avenir", size: 12))
                        Spacer()
                        Image(systemName: "airplane.departure")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(String(squad.trips!.count))
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
                
                
            }
            .padding(.horizontal, 20)
        }
        .padding(5)
        
    }
}

struct SquadCardView_Previews: PreviewProvider {
    static var previews: some View {
        SquadCardView(squadIndex: 1)
    }
}

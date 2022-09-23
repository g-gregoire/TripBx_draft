//
//  SquadCardCircle.swift
//  TripBx_draft
//
//  Created by Georges Gregoire on 2022-09-23.
//

import SwiftUI

struct SquadCardCircle: View {
    
    @EnvironmentObject var model: TripModel
    var squadIndex: Int
    
    var squad: Squad {
        return model.squads[squadIndex]
    }
    
    var body: some View {
        
        
        VStack {
            ZStack {
                Circle()
                    .frame(width: 80, height: 80)
                    .shadow(radius: 15, x: -10, y: 10)
                Image(squad.image!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
            }
            Text(squad.name)
                .font(Font.custom("Avenir", size: 13))
                .frame(width:100)
                .lineLimit(1)
                .truncationMode(.tail)
        }
        
    }
}

struct SquadCardCircle_Previews: PreviewProvider {
    static var previews: some View {
        SquadCardCircle(squadIndex: 1)
            .environmentObject(TripModel())
    }
}

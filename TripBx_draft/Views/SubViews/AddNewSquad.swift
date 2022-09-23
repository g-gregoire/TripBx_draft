//
//  AddNewSquad.swift
//  TripBx_draft
//
//  Created by Georges Gregoire on 2022-09-23.
//

import SwiftUI

struct AddNewSquad: View {
    
    @EnvironmentObject var model: TripModel
    
    var body: some View {
        
        
        VStack {
            ZStack {
                Circle()
                    .foregroundColor(Color(UIColor(displayP3Red: 0.3, green: 0.3, blue: 0.3, alpha: 0.4)))
                    .frame(width: 80, height: 80)
                    .shadow(radius: 15, x: -10, y: 10)
                Text("+")
                    .foregroundColor(.white)
                    .font(.custom("Avenir", size: 60))
            }
            Text("Add Squad")
                .font(Font.custom("Avenir", size: 13))
                .frame(width:100)
                .lineLimit(1)
                .truncationMode(.tail)
        }
        
    }
}

struct AddNewSquad_Previews: PreviewProvider {
    static var previews: some View {
        AddNewSquad()
    }
}

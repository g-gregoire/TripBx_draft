//
//  AddNewView.swift
//  TripBx_draft
//
//  Created by Georges Gregoire on 2022-09-22.
//

import SwiftUI

struct AddNewView: View {
    
    var letter: String
    var text: String
    var body: some View {
        
        
        VStack {
            ZStack {
                Circle()
                    .foregroundColor(Color(UIColor(displayP3Red: 0.5, green: 0.5, blue: 0.5, alpha: 0.4)))
                    .frame(width: 70, height: 70)
                    .shadow(radius: 10, x: -10, y: 10)
                Text(letter)
                    .foregroundColor(.white)
                    .font(.custom("Avenir", size: 55))
            }
            Text(text)
                .font(Font.custom("Avenir", size: 13))
        }
        
    }
}

struct AddNewView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewView(letter: "+", text: "Add New")
    }
}

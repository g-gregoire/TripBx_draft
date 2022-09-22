//
//  PhotoButtonView.swift
//  TripBx_draft
//
//  Created by Georges Gregoire on 2022-09-20.
//

import SwiftUI

struct CircleButtonView: View {
    
    var color: Color
    var letter: String
    var text: String
    var body: some View {
        
        
        VStack {
            ZStack {
                Circle()
                    .foregroundColor(color)
                    .frame(width: 80, height: 80)
                    .shadow(radius: 15, x: -10, y: 10)
                Text(letter)
                    .foregroundColor(.white)
                    .font(.custom("Avenir", size: 50))
            }
            Text(text)
                .font(Font.custom("Avenir", size: 14))
        }
        
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonView(color: .blue, letter: "P", text: "View Photos")
    }
}

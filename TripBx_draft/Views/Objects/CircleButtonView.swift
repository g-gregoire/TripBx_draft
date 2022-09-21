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
                    .frame(width: 95, height: 95)
                Text(letter)
                    .foregroundColor(.white)
                    .font(.custom("Arial", size: 50))
            }
            Text(text)
                .font(.callout)
        }
        
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonView(color: .blue, letter: "P", text: "View Photos")
    }
}

//
//  PhotoButtonView.swift
//  TripBx_draft
//
//  Created by Georges Gregoire on 2022-09-20.
//

import SwiftUI

struct PhotoButtonView: View {
    var body: some View {
        
        VStack {
            ZStack {
                Circle()
                    .foregroundColor(.green)
                    .frame(width: 95, height: 95)
                Text("P")
                    .foregroundColor(.white)
                    .font(.custom("Arial", size: 50))
            }
            Text("View Photos")
                .font(.callout)
        }
        
    }
}

struct PhotoButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoButtonView()
    }
}

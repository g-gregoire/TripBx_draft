//
//  SquadCardView.swift
//  TripBx_draft
//
//  Created by Georges Gregoire on 2022-09-11.
//

import SwiftUI

struct SquadCardView: View {
    
    var name: String
    var desc: String
    var image: String
    var memberCount: Int
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 110), contentMode: .fit)
            
            HStack {

                Image(image)
                    .resizable()
                    .frame(width: 95, height: 95)
                    .clipShape(Circle())
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(name)
                        .bold()
                    Text(desc)
                        .padding(.bottom, 10)
                        .font(.caption)
                    
                    // Icons
                    HStack {
                        // Number of lessons/questions
                        Image(systemName: "person.2")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text("Members: \(String(memberCount))")
                            .font(Font.system(size: 10))
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 20)
        }
        .padding(5)
        
    }
}

struct SquadCardView_Previews: PreviewProvider {
    static var previews: some View {
        SquadCardView(name: "Uni Friends", desc: "Still friends...", image: "squad2", memberCount: 4)
    }
}

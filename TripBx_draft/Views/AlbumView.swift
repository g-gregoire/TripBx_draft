//
//  AlbumView.swift
//  TripBx_draft
//
//  Created by Georges Gregoire on 2022-09-14.
//

import SwiftUI

struct AlbumView: View {
    
    @EnvironmentObject var model: TripModel
    var body: some View {
        
//        let photoURL = Constants.fileStoreURL
//        let photoPath = "2DCCFFED-F2CD-4B9F-B675-135A491D117F.JPG"
        
        VStack {
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                    ForEach(model.imagesData, id:\.self) { image in
                        if image != nil {
                            let uiImage = UIImage(data: image!)
                            Image(uiImage: uiImage!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 160, height: 160)
                                .clipped()
                                .cornerRadius(5)
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView()
            .environmentObject(TripModel())
    }
}

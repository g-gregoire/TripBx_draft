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
        
        let photoURL = Constants.fileStoreURL
        let photoPath = "2DCCFFED-F2CD-4B9F-B675-135A491D117F.JPG"
        
        VStack {
            Button {
                model.getImageData(hostURL: photoURL, photoPath: photoPath)
            } label: {
                Text("Hello")
            }
            
            if model.imageData != nil {
                let uiImage = UIImage(data: model.imageData!)
                Image(uiImage: uiImage!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .clipped()
            }
        }
        
        
        
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView()
            .environmentObject(TripModel())
    }
}

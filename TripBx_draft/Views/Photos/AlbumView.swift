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
        
        VStack(alignment: .center) {
            
            ScrollView {
                // Show scroll until 10 or half the images have loaded
                if model.imagesData.count < 10 || model.imagesData.count < model.images.count/2 {
                    ProgressView()
                }
                else {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                    ForEach(model.imagesData, id:\.self) { image in
                        if image != nil {
                            let uiImage = UIImage(data: image!)
                            VStack{
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
            }
        }
        //.navigationBarHidden(true)
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView()
            .environmentObject(TripModel())
    }
}

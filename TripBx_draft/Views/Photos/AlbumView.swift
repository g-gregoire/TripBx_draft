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
        
        VStack(alignment: .leading) {
            Text("Album Photos")
                .font(Font.custom("Avenir Heavy", size: 28))
                .padding(10)
            
            GeometryReader { geo in
            ScrollView {
                // Show preview until 10 or half the images have loaded
                if model.imagesData.count < 10 || model.imagesData.count < model.images.count/2 {
                    ProgressView()
                }
                else {
                    
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 5) {
                            ForEach(model.imagesData, id:\.self) { image in
                                if image != nil {
                                    let uiImage = UIImage(data: image!)
                                    VStack{
                                        Image(uiImage: uiImage!)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: (geo.size.width/3)-3, height: (geo.size.width/3)-3)
                                            .clipped()
                                            .cornerRadius(5)
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(5)
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

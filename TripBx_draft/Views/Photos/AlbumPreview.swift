//
//  AlbumPreview.swift
//  TripBx_draft
//
//  Created by Georges Gregoire on 2022-09-22.
//

import SwiftUI

struct AlbumPreview: View {
    
    @EnvironmentObject var model: TripModel
    var body: some View {
        
        NavigationLink {
            AlbumView()
        } label: {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text("Trip Photos")
                        .font(Font.custom("Avenir Heavy", size: 20))

                    Image(systemName: "chevron.right")
                    Spacer()                    
                }
                    // Show preview until 8 or half the images have loaded
                    if model.imagesData.count < 8 || model.imagesData.count < model.images.count/2 {
                        ProgressView()
                    }
                    else {
                        GeometryReader { geo in
                        LazyHGrid(rows: [GridItem(.flexible()), GridItem(.flexible())], spacing: 0) {
                            ForEach(0..<8) { index in
                                
                                let image = model.imagesData[index]
                                if image != nil {
                                
                                    let uiImage = UIImage(data: image!)
                                        Image(uiImage: uiImage!)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: geo.size.width/4, height: geo.size.height/2)
                                            .clipped()
                                }
                            }
                        }
                    }
                    .frame(height: 200)
                }
            }
            .foregroundColor(.black) 
        }
        .padding(10)
    }
}

struct AlbumPreview_Previews: PreviewProvider {
    static var previews: some View {
        AlbumPreview()
    }
}

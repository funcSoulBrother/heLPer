//
//  albumDetails.swift
//  heLPer
//
//  Created by Daniel Marsh on 11/8/24.
//

import SwiftUI
import SwiftData

struct AlbumDetails: View {
    @Environment(\.modelContext) private var context
    @Bindable var album: Album
    @Query var albums: [Album]
    
    var body: some View {
        VStack {
            Image(album.albumCover)
                .resizable()
                .frame(width: 250, height: 250)
            Text(album.title)
                .padding()
                .font(.system(size: 32))
            Text(album.artist)
                .font(.system(size: 24))
            Text(album.year)
                .padding()
                .font(.system(size: 18))
            if album.inCollection == false {
                Button("Add to Collection") {
                    context.insert(album)
                    album.inCollection = true
                    }
                .detailsButtonStyle()
                }
            else {
                Button("Remove from Collection") {
                    album.inCollection = false
                }
                .detailsButtonStyle()
                }
            if album.inWishList == false {
                Button("Add to Wish List") {
                    context.insert(album)
                    album.inWishList = true
                }
                .detailsButtonStyle()
            }
            else {
                Button("Remove from Wish List") {
                    album.inWishList = false
                }
                .detailsButtonStyle()
            }
        }
    }
}

extension View {

    func detailsButtonStyle() -> some View {
        self.padding(6)
            .background(Color.gray)
            .foregroundColor(.black)
            .cornerRadius(30)
    }
}

#Preview {
    AlbumDetails(album: Album(title: ixora.title, artist: ixora.artist, albumCover: ixora.albumCover, year: ixora.year, inCollection: ixora.inCollection, inWishList: ixora.inWishList))
}

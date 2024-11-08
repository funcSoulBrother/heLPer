//
//  albumDetails.swift
//  heLPer
//
//  Created by Daniel Marsh on 11/8/24.
//

import SwiftUI

struct AlbumDetails: View {
    @Bindable var album: Album
    
    var body: some View {
        VStack {
            Image(album.albumCover)
            Text(album.title)
                .padding()
                .font(.system(size: 32))
            Text(album.artist)
                .font(.system(size: 24))
            Text(album.year)
                .padding()
                .font(.system(size: 18))
            
        }
    }
}

#Preview {
    AlbumDetails(album: Album(title: ixora.title, artist: ixora.artist, albumCover: ixora.albumCover, year: ixora.year, inCollection: ixora.inCollection, inWishList: ixora.inWishList))
}

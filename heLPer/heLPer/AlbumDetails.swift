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
                    album.inCollection = true
                    }
                .padding(6)
                .background(Color.gray)
                .foregroundColor(.black)
                .cornerRadius(30)
                }
            else {
                Button("Remove from Collection") {
                    album.inCollection = false
                }
                .padding(6)
                .background(Color.gray)
                .foregroundColor(.black)
                .cornerRadius(30)
                }
            if album.inWishList == false {
                Button("Add to Wish List") {
                    album.inWishList = true
                }
                .padding(6)
                .background(Color.gray)
                .foregroundColor(.black)
                .cornerRadius(30)
            }
            else {
                Button("Remove from Wish List") {
                    album.inWishList = false
                }
                .padding(6)
                .background(Color.gray)
                .foregroundColor(.black)
                .cornerRadius(30)
            }
        }
    }
}

#Preview {
    AlbumDetails(album: Album(title: ixora.title, artist: ixora.artist, albumCover: ixora.albumCover, year: ixora.year, inCollection: ixora.inCollection, inWishList: ixora.inWishList))
}

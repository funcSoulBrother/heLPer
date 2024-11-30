//
//  CollectionView.swift
//  heLPer
//
//  Created by Daniel Marsh on 10/11/24.
//

import SwiftUI
import SwiftData

struct WishListView: View {
    
    @Environment(\.modelContext) private var context
    @Query(sort: \Album.artist, order: .forward) var albums: [Album]
    
    var body: some View {
        
        let isInWishList: [Album] = albums.filter { $0.inWishList == true }
        
        NavigationStack {
            List(isInWishList) { album in
                NavigationLink(destination: AlbumDetails(album: album)) {
                    HStack {
                        Image(album.albumCover)
                            .resizable()
                            .frame(width: 100, height: 100)
                        VStack (alignment: .leading) {
                            Text(album.artist)
                                .font(Font.system(size: 18))
                            Text(album.title)
                                .font(Font.system(size: 14))
                        }
                    }
                }
            }
            .overlay {
                if isInWishList.isEmpty {
                    ContentUnavailableView(label: {
                        Label("Wish List is Empty", systemImage: "heart.square")
                    }, description: {
                        Text("Try searching for an album and adding it to your wish list!")
                        }
                    )
                }
            }
            .navigationTitle("Wish List")
        }
    }
}

#Preview {
    WishListView()
}


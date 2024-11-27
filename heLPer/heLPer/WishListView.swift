//
//  CollectionView.swift
//  heLPer
//
//  Created by Daniel Marsh on 10/11/24.
//

import SwiftUI
import SwiftData

struct WishListView: View {
    var isInWishList = allAlbums.filter { $0.inWishList == true }
    @Environment(\.modelContext) private var context
//    @Query var albums: [Album] = []
    
    var body: some View {
        
        
            NavigationStack {
                
                List(isInWishList) { album in
                    NavigationLink(album.title, value: album)
                    }
                    .navigationDestination(
                        for: Album.self,
                      destination: { album in
                          AlbumDetails(album: album)
                    }
                )
            .navigationTitle("Wish List")
        }
    }
}

#Preview {
    WishListView()
}


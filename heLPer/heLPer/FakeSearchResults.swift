//
//  FakeSearchResults.swift
//  heLPer
//
//  Created by Daniel Marsh on 11/8/24.
//

import SwiftUI

struct FakeSearchResults: View {
    var isNotInCollectionOrWishList = allAlbums.filter { $0.inCollection == false && $0.inWishList == false }
    
    var body: some View {
        
        
            NavigationStack {
                
                List(isNotInCollectionOrWishList) { album in
                    NavigationLink(album.title, value: album)
                    }
                    .navigationDestination(
                        for: Album.self,
                      destination: { album in
                          AlbumDetails(album: album)
                    }
                )
            .navigationTitle("Fake Search Results")
        }
    }
}

#Preview {
    FakeSearchResults()
}

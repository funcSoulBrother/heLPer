//
//  CollectionView.swift
//  heLPer
//
//  Created by Daniel Marsh on 10/11/24.
//

import SwiftUI

struct CollectionView: View {
    var isInCollection = allAlbums.filter { $0.inCollection == true }
    
    var body: some View {
        
        
            NavigationStack {
                
                List(isInCollection) { album in
                      // 1
                    NavigationLink(album.title, value: album)
                    }
                    // 2
                    .navigationDestination(
                      // 3
                        for: Album.self,
                      // 4
                      destination: { album in
                          AlbumDetails(album: album)
                      }
                    )
                    .navigationTitle("Collection")
            }
    }
}

#Preview {
    CollectionView()
}

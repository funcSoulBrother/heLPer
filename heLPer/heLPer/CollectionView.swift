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
                    NavigationLink(album.title, value: album)
                    }
                    .navigationDestination(
                        for: Album.self,
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

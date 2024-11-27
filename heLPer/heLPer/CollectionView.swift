//
//  CollectionView.swift
//  heLPer
//
//  Created by Daniel Marsh on 10/11/24.
//

import SwiftUI
import SwiftData

struct CollectionView: View {
    var isInCollection = allAlbums.filter { $0.inCollection == true }
    @Environment(\.modelContext) private var context
    @Query var albums: [Album]
    
    
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
            .overlay {
                if isInCollection.isEmpty {
                    ContentUnavailableView(label: {
                        Label("Collection is Empty", systemImage: "globe")
                    }, description: {
                        Text("Do something or whatever, geez.")
                    })
                }
            }
            .offset(y: -40)
        }
    }
}


#Preview {
    CollectionView()
}

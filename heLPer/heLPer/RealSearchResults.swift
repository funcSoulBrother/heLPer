//
//  RealSearchResults.swift
//  heLPer
//
//  Created by Daniel Marsh on 11/22/24.
//

import SwiftUI
import SwiftData

struct RealSearchResults: View {
    var notInCollectionOrWishList: [Album] = allAlbums.filter { $0.inCollection == false && $0.inWishList == false }
    @Environment(\.modelContext) private var context
    @Query(sort: \Album.artist, order: .forward) var albums: [Album]
    
    var body: some View {
        
        NavigationStack {
            List(notInCollectionOrWishList) { album in
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
                    //                        NavigationLink(album.title, value: album)
                    //                        }
                    //                        .navigationDestination(
                    //                            for: Album.self,
                    //                          destination: { album in
                    //                              AlbumDetails(album: album)
                    //                        }
                    //                    )
                }
//                .onTapGesture {
//                    NavigationLink(album.title, value: album)
//                    .navigationDestination(
//                        for: Album.self,
//                        destination: { album in
//                            AlbumDetails(album: album)
//                        }
//                            )
//                        }
                }
                .navigationTitle("Search Results")
            }
        }
    }


#Preview {
    RealSearchResults()
}

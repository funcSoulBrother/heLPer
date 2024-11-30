//
//  AlbumAPITestSearchBarEditionTwo.swift
//  heLPer
//
//  Created by Daniel Marsh on 11/28/24.
//

import SwiftUI

struct ContentViewTwo: View {
    @State private var albumSearchResultsWow: APIAlbum?
    @State private var searchText = ""
    @State private var navigateToSearchResults = false

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter an Artist Name and Hit Enter", text: $searchText, onCommit: {
                    Task {
                        do {
                            albumSearchResultsWow = try await getAlbumSearchResults()
                        } catch {
                        //handle errors
                            }
                        }
                    navigateToSearchResults = true
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                NavigationLink(
                    destination: APISearchResults(),
                    isActive: $navigateToSearchResults
                ) {
                    EmptyView()
                }
            }
            .navigationTitle("Search")
        }
    }
}

struct APISearchResults: View {
    @State private var albumSearchResultsWow: APIAlbum?
    var body: some View {
        VStack {
            Text("This is a test view, yes it is.")
                .font(.largeTitle)
            Text(albumSearchResultsWow?.title ?? "NO TITLE")
            Text(albumSearchResultsWow?.year ?? "NO YEAR")
            AsyncImage(url: URL(string: albumSearchResultsWow?.albumCover ?? "")) {
                image in image
                    .resizable()
                    .frame(width: 100, height: 100)
            } placeholder: {
                Rectangle()
                    .foregroundColor(.secondary)
                    .frame(width: 100, height: 100)
            }
            
        }
        }
    }

//struct DetailView: View {
//    let query: String
//    
//    var body: some View {
//        VStack {
//            Text("Search Query: \(query)")
//                .font(.largeTitle)
//            // Your additional view content goes here
//        }
//        .navigationTitle("Detail")
//    }
//}




#Preview {
    ContentViewTwo()
}

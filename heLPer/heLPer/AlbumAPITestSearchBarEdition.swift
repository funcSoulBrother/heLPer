//
//  AlbumAPISearchBarEdition.swift
//  heLPer
//
//  Created by Daniel Marsh on 11/28/24.
//

import SwiftUI

struct SearchBar: View {
    @State private var searchQuery = ""
    @State private var showSearchResults = false

    var body: some View {
        HStack {
            TextField("Search", text: $searchQuery)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.default)
                .onSubmit {
                    showSearchResults = true
                }
            Button(action: {
                showSearchResults = true
            }) {
                Text("Search")
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal)
        .navigationBarTitle("Search")
    }
}

struct SearchResultsView: View {
    let searchQuery: String

    init(searchQuery: String) {
        self.searchQuery = searchQuery
    }

    var body: some View {
        Text("Search results for: \(searchQuery)")
    }
}

struct ContentViewDos: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: SearchResultsView(searchQuery: ""), isActive: .constant(false)) {
                SearchBar()
            }
        }
    }
}

#Preview {
    ContentViewDos()
}

//
//  ContentView.swift
//  heLPer
//
//  Created by Daniel Marsh on 10/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 1
    var body: some View {
       
        
        TabView (selection: $selectedTab) {
            CollectionView()
                .tabItem{
                    Label("Collection", systemImage: "music.note.house.fill")
                }
                .tag(0)
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass.circle.fill")
                }
                .tag(1)
            WishListView()
                .tabItem {
                    Label("Wish List", systemImage: "star.square.fill")
                }
                .tag(2)
        }
    }
}


#Preview {
    ContentView()
}
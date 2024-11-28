//
//  ContentView.swift
//  heLPer
//
//  Created by Daniel Marsh on 10/11/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @AppStorage("selectedTab") private var savedSelectedTab: Int = 1
    
    
    var body: some View {
       
        
        TabView (selection: $savedSelectedTab) {
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
                    Label("Wish List", systemImage: "heart.square.fill")
                }
                .tag(2)
        }
    }
}


#Preview {
    ContentView()
}

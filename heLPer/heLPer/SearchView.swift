//
//  SearchView.swift
//  heLPer
//
//  Created by Daniel Marsh on 10/11/24.
//

import SwiftUI

struct SearchView: View {
    @State private var showSearchResults = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image("helperlogo")
                    .padding()
            NavigationLink(destination: FakeSearchResults(), isActive: $showSearchResults) {
                Button("Fake Search Bar That's Actually a Button", systemImage: "magnifyingglass") {
                    self.showSearchResults = true
                        }
                .padding()
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(30)
                    }
                }
            .offset(y: -85)
                //            Capsule()
                //                .fill(.gray)
                //                .frame(height: 50)
                //        }
                //        .padding()
                //        .offset(y: -100)
        }
    }
}

#Preview {
    SearchView()
}

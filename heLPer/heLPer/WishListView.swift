//
//  CollectionView.swift
//  heLPer
//
//  Created by Daniel Marsh on 10/11/24.
//

import SwiftUI

struct WishListView: View {
    var body: some View {
            NavigationStack {
                
                List {
                    HStack {
                        Image("angels&we")
                            .resizable()
                            .frame(width: 100, height: 100)
                        VStack {
                            Text("Angels & Airwaves")
                            Text("We Don't Need to Whisper")
                        }
                    }
                    HStack {
                        Image("copelandixora")
                            .resizable()
                            .frame(width: 100, height: 100)
                        VStack {
                            Text("Copeland")
                            Text("Ixora")
                        }
                    }
                    HStack {
                        Image("systemofsteal")
                            .resizable()
                            .frame(width: 100, height:100)
                        VStack {
                            Text("System of a Down")
                            Text("Steal This Album!")
                        }
                    }
                }
                .navigationTitle("Wish List")
            }
        }
}

#Preview {
    WishListView()
}


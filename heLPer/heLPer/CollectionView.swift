//
//  CollectionView.swift
//  heLPer
//
//  Created by Daniel Marsh on 10/11/24.
//

import SwiftUI

struct CollectionView: View {
    var body: some View {
            NavigationStack {
                
                List {
                    HStack {
                        Image("anberlinblueprints")
                            .resizable()
                            .frame(width: 100, height: 100)
                        VStack {
                            Text("Anberlin")
                            Text("Blueprints for the Black Market")
                        }
                    }
                    HStack {
                        Image("handsomedevillove")
                            .resizable()
                            .frame(width: 100, height: 100)
                        VStack {
                            Text("Handsome Devil")
                            Text("Love & Kisses from the Underground")
                        }
                    }
                    HStack {
                        Image("deathcabcodes")
                            .resizable()
                            .frame(width: 100, height:100)
                        VStack {
                            Text("Death Cab for Cutie")
                            Text("Codes and Keys")
                        }
                    }
                }
                .navigationTitle("Collection")
            }
        }
}

#Preview {
    CollectionView()
}

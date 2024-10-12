//
//  SearchView.swift
//  heLPer
//
//  Created by Daniel Marsh on 10/11/24.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        VStack {
            Image("helperlogo")
                .padding()
            Capsule()
                .fill(.gray)
                .frame(height: 50)
        }
        .padding()
        .offset(y: -100)
    }
}

#Preview {
    SearchView()
}

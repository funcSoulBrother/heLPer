//
//  SearchView.swift
//  heLPer
//
//  Created by Daniel Marsh on 10/11/24.
//

import SwiftUI

struct SearchView: View {
    @State private var showSearchResults = false
    @State private var searchText = ""
    @State private var errorMessage: String?
    
    var body: some View {
        NavigationView {
            VStack {
                Image("helperlogo")
                    .padding()
            .searchable(text: $searchText, prompt: Text("Enter Artist and Hit Enter"))
            .onSubmit(of: .search) {
              let apiKey = "PqXYavZvWWSOCvvVZIdaJLdgjQcvlFJWBWdnvBLY"
              guard let url = URL(string: "https://api.discogs.com/database/search?q=\(searchText)&token=\(apiKey)") else {
                print("Invalid URL")
                return
              }
              let session = URLSession.shared
              let task = session.dataTask(with: url) { data, response, error in
                if let error {
                  print("Error: \(error.localizedDescription)")
                  return
                }

                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                  print("Invalid Response")
                  return
                }

                guard let data else {
                  print("No data received")
                  return
                }
                print(String(data: data, encoding: .utf8) ?? "")
              }
              task.resume()
            }
                
                
            NavigationLink(destination: RealSearchResults(), isActive: $showSearchResults) {
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

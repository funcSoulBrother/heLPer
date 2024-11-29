//
//  AlbumAPI.swift
//  heLPer
//
//  Created by Daniel Marsh on 11/22/24.
//

//import Foundation
//import OSLog
import SwiftUI

struct APIAlbum: Codable {
    let title: String
    let albumCover: String
    let year: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case albumCover = "cover_image"
        case year
    }
}

func getAlbumSearchResults() async throws -> APIAlbum {
    @State var searchText = ""
    let apiKey = "PqXYavZvWWSOCvvVZIdaJLdgjQcvlFJWBWdnvBLY"
    let endpoint = "https://api.discogs.com/database/search?q=\(searchText)&token=\(apiKey)"
    guard let url = URL(string: endpoint) else {
        throw AlbumError.invalidURL
    }
    let (data, response) = try await URLSession.shared.data(from: url)
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw AlbumError.invalidResponse
    }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(APIAlbum.self, from: data)
    } catch {
        throw AlbumError.invalidData
    }
}

enum AlbumError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

struct AlbumAPITest: View {
    @State private var searchResultsAlbum: APIAlbum?
    var body: some View {
        VStack {
            Text("This is a test view, yes it is.")
                .font(.largeTitle)
            Text(searchResultsAlbum?.title ?? "NO TITLE")
            Text(searchResultsAlbum?.year ?? "NO YEAR")
            AsyncImage(url: URL(string: searchResultsAlbum?.albumCover ?? "")) {
                image in image
                    .resizable()
                    .frame(width: 100, height: 100)
            } placeholder: {
                Rectangle()
                    .foregroundColor(.secondary)
                    .frame(width: 100, height: 100)
            }
            
        }
        .task {
            do {
                searchResultsAlbum = try await getAlbumSearchResults()
            } catch {
            
                }
            }
        }
    }



//enum AlbumAPIError: Error {
//  case networkError
//  case serverResponseError
//  case resultParsingError
//}
//
//protocol AlbumAPI {
//    func searchAlbums() async throws -> [Album]
//}
//
//class AlbumAPIService: AlbumAPI {
//  struct Response: Codable {
//    let status: String
//    let totalResults: Int
//    let albums: [Album]
//  }
//
//    static let apiKey = "PqXYavZvWWSOCvvVZIdaJLdgjQcvlFJWBWdnvBLY"
//    static let albumURL = URL(string: "https://newsapi.org/v2/everything?q=apple&apiKey=\(apiKey)")!
//
//    func searchAlbums() async throws -> [Album] {
//    let (data, response) = try await URLSession.shared.data(from: Self.albumURL)
//
//    guard let httpResponse = response as? HTTPURLResponse, httpResponse.isOK else {
////      Logger.main.error("Network response error")
//        throw AlbumAPIError.serverResponseError
//    }
//
//    let apiResponse = try JSONDecoder().decode(Response.self, from: data)
////    Logger.main.info("Response status: \(apiResponse.status)")
////    Logger.main.info("Total results: \(apiResponse.totalResults)")
//
//        return apiResponse.albums
////            .filter { $0.artist != nil && $0.albumCover != nil }
//  }
//}
//
////class MockNewsService: NewsService {
////  func latestNews() async throws -> [Article] {
////    return [
////      Article(
////        title: "Lorem Ipsum",
////        url: URL(string: "https://apple.com"),
////        author: "Author",
////        description:
////        """
////        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
////        incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...
////        """,
////        urlToImage: "https://picsum.photos/300"
////      )
////    ]
////  }
////}
//
//extension HTTPURLResponse {
//  var isOK: Bool { statusCode == 200}
//}

#Preview {
    AlbumAPITest()
}

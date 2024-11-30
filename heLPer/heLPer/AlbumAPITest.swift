//
//  AlbumAPI.swift
//  heLPer
//
//  Created by Daniel Marsh on 11/22/24.
//

import Foundation
//import OSLog
import SwiftUI

// MARK: - Welcome
struct APIResult: Codable {
    let pagination: Pagination
    let results: [APIAlbum]
}

// MARK: - Pagination
struct Pagination: Codable {
    let page, pages, perPage, items: Int
    let urls: Urls

    enum CodingKeys: String, CodingKey {
        case page, pages
        case perPage = "per_page"
        case items, urls
    }
}

// MARK: - Urls
struct Urls: Codable {
    let last, next: String
}

// MARK: - Result
struct APIAlbum: Codable {
    let id: Int
    let type: TypeEnum
    let userData: UserData
    let masterID: Int?
    let masterURL: String?
    let uri, title: String
    let thumb: String
    let coverImage: String
    let resourceURL: String
    let country, year: String?
    let format, label: [String]?
    let genre: [Genre]?
    let style, barcode: [String]?
    let catno: String?
    let community: Community?
    let formatQuantity: Int?
    let formats: [Format]?

    enum CodingKeys: String, CodingKey {
        case id, type
        case userData = "user_data"
        case masterID = "master_id"
        case masterURL = "master_url"
        case uri, title, thumb
        case coverImage = "cover_image"
        case resourceURL = "resource_url"
        case country, year, format, label, genre, style, barcode, catno, community
        case formatQuantity = "format_quantity"
        case formats
    }
}

// MARK: - Community
struct Community: Codable {
    let want, have: Int
}

// MARK: - Format
struct Format: Codable {
    let name: Name
    let qty: String
    let descriptions: [String]
    let text: String?
}

enum Name: String, Codable {
    case cDR = "CDr"
    case cassette = "Cassette"
    case cd = "CD"
    case vhs = "VHS"
    case vinyl = "Vinyl"
}

enum Genre: String, Codable {
    case classical = "Classical"
    case electronic = "Electronic"
    case hipHop = "Hip Hop"
    case jazz = "Jazz"
    case nonMusic = "Non-Music"
    case pop = "Pop"
    case rock = "Rock"
}

enum TypeEnum: String, Codable {
    case artist = "artist"
    case label = "label"
    case master = "master"
    case release = "release"
}

// MARK: - UserData
struct UserData: Codable {
    let inWantlist, inCollection: Bool

    enum CodingKeys: String, CodingKey {
        case inWantlist = "in_wantlist"
        case inCollection = "in_collection"
    }
}

//struct APIAlbum: Codable {
//    let title: String
//    let albumCover: String
//    let year: String
//    
//    enum CodingKeys: String, CodingKey {
//        case title
//        case albumCover = "cover_image"
//        case year
//    }
//}

func getAlbumSearchResults() async throws -> APIResult {
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
        let decodedData = try decoder.decode(APIResult.self, from: data)
        print(decodedData)
        return decodedData
    } catch {
        print(error)
        throw
        AlbumError.invalidData
    }
}

enum AlbumError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

struct AlbumAPITest: View {
    @State private var searchResultsAlbums: APIResult
    var body: some View {
        
        NavigationStack {
            List(searchResultsAlbums) { album in
                    NavigationLink(destination: AlbumDetails(album: album)) {
                        HStack {
                            AsyncImage(url: URL(string: album.coverImage ?? "")) { image in image
                                    .resizable()
                                frame(width: 100, height: 100)
                            } placeholder: {
                                Rectangle()
                                    .foregroundColor(.secondary)
                                    .frame(width: 100, height: 100)
                            }
                            VStack (alignment: .leading) {
                                Text(album.title)
                                    .font(Font.system(size: 20))
                            }
                        }
                        
                    }
                    
                }
                .overlay {
                    if searchResultsAlbums.isEmpty {
                        ContentUnavailableView(label: {
                            Label("No Search Results", systemImage: "exclamationmarkmagnifyingglass")
                        }, description: {
                            Text("Check your spelling or maybe just try something else? I don't know.")
                        }
                        )
                    }
            }
                .navigationTitle("Search Results")
            }
        
//        VStack {
//            Text("This is a test view, yes it is.")
//                .font(.largeTitle)
//            Text(searchResultsAlbums?.title ?? "NO TITLE")
//            Text(searchResultsAlbums?.year ?? "NO YEAR")
//            AsyncImage(url: URL(string: searchResultsAlbums?.albumCover ?? "")) {
//                image in image
//                    .resizable()
//                    .frame(width: 100, height: 100)
//            } placeholder: {
//                Rectangle()
//                    .foregroundColor(.secondary)
//                    .frame(width: 100, height: 100)
//            }
//            
//        }
        .task {
            do {
                searchResultsAlbums = try await getAlbumSearchResults()
            } catch {
            //handle these errors later
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
//    AlbumAPITest()
}

//
//  heLPerData.swift
//  heLPer
//
//  Created by Daniel Marsh on 11/7/24.
//

import SwiftUI
import Observation

@Observable
final class Album {
    var title: String
    var artist: String
    var albumCover: String
    var year: String
    var inCollection: Bool
    var inWishList: Bool
    
    init(title: String, artist: String, albumCover: String, year: String, inCollection: Bool, inWishList: Bool) {
        self.title = title
        self.artist = artist
        self.albumCover = albumCover
        self.year = year
        self.inCollection = inCollection
        self.inWishList = inWishList
    }
    
    //Equatable and stuff to go here eventually
    
}

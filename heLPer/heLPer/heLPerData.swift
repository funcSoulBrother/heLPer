//
//  heLPerData.swift
//  heLPer
//
//  Created by Daniel Marsh on 11/7/24.
//

import SwiftUI
import Observation

@Observable
final class Album: Identifiable, Hashable, Equatable {
    var id = UUID () //allows Album to conform to Identifiable
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
    
    //function to allow Album to conform to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(artist)
        hasher.combine(albumCover)
        hasher.combine(year)
        hasher.combine(inCollection)
        hasher.combine(inWishList)
        
      }
    
    //function to allow Album to conform to Equatable
    static func == (lhs: Album, rhs: Album) -> Bool {
        return lhs.id == rhs.id && lhs.title == rhs.title && lhs.artist == rhs.artist && lhs.albumCover == rhs.albumCover && lhs.year == rhs.year && lhs.inCollection == rhs.inCollection && lhs.inWishList == rhs.inWishList
      }
    
}

//DUMMY DATA

let allAlbums = [blueprintsForTheBlackMarket, loveAndKissesFromTheUnderground, codesAndKeys, weDontNeedToWhisper, stealThisAlbum, ixora, sticksAndStones, harrysHouse, sidewalks, offWithTheirHeads]

let blueprintsForTheBlackMarket = Album(title: "Blueprints for the Black Market", artist: "Anberlin", albumCover: "anberlinblueprints", year: "2003", inCollection: true, inWishList: false)

let loveAndKissesFromTheUnderground = Album(title: "Love & Kisses from the Underground", artist: "Handsome Devil", albumCover: "handsomedevillove", year: "2001", inCollection: true, inWishList: false)

let codesAndKeys = Album(title: "Codes and Keys", artist: "Death Cab for Cutie", albumCover: "deathcabcodes", year: "2011", inCollection: true, inWishList: false)

let weDontNeedToWhisper = Album(title: "We Don't Need to Whisper", artist: "Angels & Airwaves", albumCover: "angels&we", year: "2006", inCollection: false, inWishList: true)

let stealThisAlbum = Album(title: "Steal This Album!", artist: "System of a Down", albumCover: "systemofsteal", year: "2002", inCollection: false, inWishList: true)

let ixora = Album(title: "Ixora", artist: "Copeland", albumCover: "copelandixora", year: "2014", inCollection: false, inWishList: true)

let sticksAndStones = Album(title: "Sticks and Stones", artist: "New Found Glory", albumCover: "newfoundsticks", year: "2002", inCollection: false, inWishList: false)

let harrysHouse = Album(title: "Harry's House", artist: "Harry Styles", albumCover: "harrystylesharrys", year: "2022", inCollection: false, inWishList: false)

let sidewalks = Album(title: "Sidewalks", artist: "Matt and Kim", albumCover: "mattandsidewalks", year: "2010", inCollection: false, inWishList: false)

let offWithTheirHeads = Album(title: "Off With Their Heads", artist: "Kaiser Chiefs", albumCover: "kaiserchiefsoff", year: "2008", inCollection: false, inWishList: false)

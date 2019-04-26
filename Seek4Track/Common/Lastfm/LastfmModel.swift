//
//  Model.swift
//  Seek4Track
//
//  Created by lyzkov on 12/03/2019.
//  Copyright © 2019 lyzkov. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let results: ResultsPage
}

struct ResultsPage: Decodable {
    let trackmatches: TrackMatches
}

struct TrackMatches: Decodable {
    let track: [Track]
}

struct Track: Decodable {
    let artist: String
    let name: String
}

struct LastfmTrack: Decodable {
    let artist: String
    let name: String
}

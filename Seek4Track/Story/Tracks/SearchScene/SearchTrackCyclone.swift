//
//  SearchTrackCyclone.swift
//  Seek4Track
//
//  Created by lyzkov on 22/01/2019.
//  Copyright © 2019 lyzkov. All rights reserved.
//

import Foundation
import RxSwift

let hardTracks: [SearchTrackItem] = [
    .init(description: "George Michael - Careless Whisper", sourceIcon: UIImage()),
    .init(description: "Celine Dion - All By Myself", sourceIcon: UIImage()),
]

enum SearchTrackEvent: Event {
    case load(tracks: [SearchTrackItem])
}

struct SearchTrackState {
    var tracks: [SearchTrackItem]
}

extension SearchTrackState: Mutable { }

extension SearchTrackState: ReducibleState {
    typealias E = SearchTrackEvent

    static var initial = SearchTrackState(tracks: [])

    static func reduce(state: SearchTrackState, _ event: SearchTrackEvent) -> SearchTrackState {
        switch event {
        case .load(let tracks):
            return .init(tracks: tracks)
        }
    }

}

final class SearchTrackCyclone: Cyclone {
    typealias State = SearchTrackState

    let load = Observable.just(hardTracks).map(SearchTrackEvent.load).asAction()

    lazy var output = state(from: load)

}

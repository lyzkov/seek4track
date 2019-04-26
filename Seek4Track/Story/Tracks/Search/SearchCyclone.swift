//
//  SearchCyclone.swift
//  Seek4Track
//
//  Created by lyzkov on 22/01/2019.
//  Copyright © 2019 lyzkov. All rights reserved.
//

import Foundation
import RxSwift

final class SearchCyclone: Cyclone {
    
    struct State: ReducibleState {
        enum Event: EventType {
            case load(tracks: [Track])
        }

        var tracks: [SearchItem]

        static var initial = State(tracks: [])

        static func reduce(state: State, _ event: Event) -> State {
            switch event {
            case .load(let tracks):
                return .init(tracks: tracks.map { SearchItem(from: $0) })
            }
        }
    }

    private let pool = TracksPool()

    lazy var load = pool.search(byName: "Careless").asAction(Event.load)

    lazy var output = state(from: load)

}

//
//  SearchCyclone.swift
//  Seek4Track
//
//  Created by lyzkov on 22/01/2019.
//  Copyright © 2019 lyzkov. All rights reserved.
//

import Foundation
import RxSwift

let tracks: [SearchItem] = [
    .init(description: "George Michael - Careless Whisper", sourceIcon: UIImage()),
    .init(description: "Celine Dion - All By Myself", sourceIcon: UIImage()),
]

final class SearchCyclone: Cyclone {
    struct State: ReducibleState {
        enum Event: EventType {
            case load(tracks: [SearchItem])
        }

        var tracks: [SearchItem]

        static var initial = State(tracks: [])

        static func reduce(state: State, _ event: Event) -> State {
            switch event {
            case .load(let tracks):
                return .init(tracks: tracks)
            }
        }
    }

    let load = Observable.just(tracks).asAction(Event.load)

    lazy var output = state(from: load)

}

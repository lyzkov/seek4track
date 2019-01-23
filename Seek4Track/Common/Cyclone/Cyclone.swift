//
//  Cyclone.swift
//  Seek4Track
//
//  Created by lyzkov on 22/01/2019.
//  Copyright © 2019 lyzkov. All rights reserved.
//

import Foundation
import RxSwift
import RxFeedback

protocol Cyclone {
    associatedtype State: ReducibleState
    typealias Event = State.Event

    func state(from events: Observable<Event>) -> Observable<State>
    func state(from actions: EventAction<Event>...) -> Observable<State>

    var output: Observable<State> { get }
}

extension Cyclone {

    func state(from events: Observable<Event>) -> Observable<State> {
        return Observable
            .system(
                initialState: State.initial,
                reduce: State.reduce,
                scheduler: MainScheduler.instance,
                scheduledFeedback: { _ in events }
            )
            .share(replay: 1, scope: .whileConnected)
    }

    func state(from actions: EventAction<Event>...) -> Observable<State> {
        return state(from: Observable.merge(actions.map { $0.elements }) )
    }

}

//
//  Event.swift
//  Seek4Track
//
//  Created by lyzkov on 22/01/2019.
//  Copyright © 2019 lyzkov. All rights reserved.
//

import Foundation
import RxSwift
import Action

protocol EventType { }

typealias EventAction<Event: EventType> = Action<Void, Event>

extension ObservableConvertibleType where E: EventType {

    func asAction() -> EventAction<E> {
        let observable = asObservable()

        return Action {
            observable
        }
    }

}

extension ObservableConvertibleType {

    func asAction<Event: EventType>(_ eventMap: @escaping (E) -> Event) -> EventAction<Event> {
        return asObservable().map(eventMap).asAction()
    }

}

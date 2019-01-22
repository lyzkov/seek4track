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

protocol Event { }

typealias EventAction<E: Event> = Action<Void, E>

extension ObservableConvertibleType where E: Event {

    func asAction() -> EventAction<E> {
        let observable = asObservable()

        return Action {
            observable
        }
    }

}

extension ObservableConvertibleType {

    func asAction<R: Event>(_ eventMap: @escaping (E) -> R) -> EventAction<R> {
        return asObservable().map(eventMap).asAction()
    }

}

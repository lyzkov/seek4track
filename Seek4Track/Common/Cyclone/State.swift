//
//  State.swift
//  Seek4Track
//
//  Created by lyzkov on 22/01/2019.
//  Copyright © 2019 lyzkov. All rights reserved.
//

import Foundation
import RxSwift

protocol ReducibleState {
    associatedtype Event: EventType

    static var initial: Self { get }
    static func reduce(state: Self, _ event: Event) -> Self
}

extension ObservableConvertibleType where E: ReducibleState {

    subscript<Value>(_ keyPath: KeyPath<E, Value>) -> Observable<Value> {
        return asObservable().map { $0[keyPath: keyPath] }
    }

}

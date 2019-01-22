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
    associatedtype E: Event

    static var initial: Self { get }
    static func reduce(state: Self, _ event: E) -> Self
}

extension ObservableConvertibleType where E: ReducibleState {

    subscript<V>(_ keyPath: KeyPath<E, V>) -> Observable<V> {
        return asObservable().map { $0[keyPath: keyPath] }
    }

}

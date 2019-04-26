//
//  Liquefiable.swift
//  Seek4Track
//
//  Created by lyzkov on 12/03/2019.
//  Copyright © 2019 lyzkov. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import RxAlamofire

protocol Liquefiable {

    associatedtype E: Endpoint & Resource where E.Result == Self

    static var endpoint: E { get }

}

extension Liquefiable {

    static func liquify() -> Single<Self> {
        return SessionManager.default.rx.decodedData(from: endpoint)
    }

}

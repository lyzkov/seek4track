//
//  TracksPool.swift
//  Seek4Track
//
//  Created by lyzkov on 05/02/2019.
//  Copyright © 2019 lyzkov. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

enum DevError: Error {
    case notImplementedYet
}

protocol DataPool {
    associatedtype DataRequest: URLRequestConvertible

    func decodedData<D: Decodable>(from request: DataRequest) -> Single<D>
}

extension DataPool {

    func decodedData<D: Decodable>(from request: DataRequest) -> Single<D> {
        return SessionManager.default.rx.decodedData(from: request)
    }

}

final class TracksPool: DataPool {
    typealias DataRequest = Lastfm.Tracks

    func search(byName phrase: String) -> Single<Results> {
        return decodedData(from: .search(phrase: phrase))
    }

    func search(byName phrase: String) -> Single<[Track]> {
        return search(byName: phrase)
            .map { (results: Results) in
                results.results.trackmatches.track
            }
    }

}

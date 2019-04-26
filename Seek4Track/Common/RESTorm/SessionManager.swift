//
//  SessionManager.swift
//  Seek4Track
//
//  Created by lyzkov on 12/03/2019.
//  Copyright © 2019 lyzkov. All rights reserved.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift

extension Reactive where Base: SessionManager {

    func data<E: Endpoint>(from endpoint: E) -> Single<Data> {
        let base = E.api.base
        return RxAlamofire.data(
            endpoint.method,
            base.url.appendingPathComponent(endpoint.path),
            parameters: base.parameters + endpoint.parameters,
            encoding: endpoint.encoding,
            headers: base.headers + endpoint.headers
        ).asSingle()
    }

    func decodedData<E: Endpoint & Resource>(from endpoint: E) -> Single<E.Result> {
        return data(from: endpoint).decode().asSingle()
    }

    func decodedData<E: Endpoint>(from endpoint: E) -> Completable {
        return data(from: endpoint).asCompletable()
    }

    func data(from request: URLRequestConvertible) -> Single<Data> {
        return self.request(urlRequest: request).data().asSingle()
    }

    func decodedData<D: Decodable>(from request: URLRequestConvertible) -> Single<D> {
        return data(from: request).decode().asSingle()
    }

}

fileprivate func + (left: Parameters, right: Parameters) -> Parameters {
    return left.merging(right, uniquingKeysWith: { _, new in new })
}

fileprivate func + (left: HTTPHeaders, right: HTTPHeaders) -> HTTPHeaders {
    return left.merging(right, uniquingKeysWith: { _, new in new })
}

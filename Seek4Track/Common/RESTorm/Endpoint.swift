//
//  Endpoint.swift
//  Seek4Track
//
//  Created by lyzkov on 05/02/2019.
//  Copyright © 2019 lyzkov. All rights reserved.
//

import Foundation
import Alamofire

protocol Endpoint: URLRequestConvertible {
    static var api: RestAPI.Type { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters { get }
    var encoding: ParameterEncoding { get }
    var headers: HTTPHeaders { get }
}

protocol Resource {
    associatedtype Result: Decodable
}

extension Endpoint {

    var headers: HTTPHeaders {
        return [:]
    }

    var parameters: Parameters {
        return [:]
    }

}

protocol GetEndpoint: Endpoint {
}

extension GetEndpoint {

    var method: HTTPMethod {
        return .get
    }

    var encoding: ParameterEncoding {
        return URLEncoding.default
    }

}

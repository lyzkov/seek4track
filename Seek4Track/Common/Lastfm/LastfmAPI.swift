//
//  LastfmAPI.swift
//  Seek4Track
//
//  Created by lyzkov on 12/03/2019.
//  Copyright © 2019 lyzkov. All rights reserved.
//

import Foundation
import Alamofire

enum Lastfm: RestAPI {

    static let base = APIConfiguration(
        url: URL(string: "http://ws.audioscrobbler.com/2.0")!,
        parameters: [
            "api_key": "dfb0c05a8f6263ae7582bd757395308d",
            "format": "json",
            ]
    )

    enum Tracks: URLRequestConvertible {

        case search(phrase: String)

        func asURLRequest() throws -> URLRequest {
            switch self {
            case let .search(phrase):
                return try Search(phrase: phrase).asURLRequest()
            }
        }

        struct Search: LastfmEndpoint, GetEndpoint {
            
            static var api: RestAPI.Type = Lastfm.self

            typealias Result = Results

            let phrase: String

            var parameters: Parameters {
                return ["track": phrase, "method": "track.search"]
            }

        }

    }

}

extension Endpoint {

    func asURLRequest() throws -> URLRequest {
        let base = Self.api.base

        return request(
            base.url + path,
            method: method,
            parameters: base.parameters + parameters,
            encoding: encoding,
            headers: base.headers + headers
        ).request!
    }

}

fileprivate func + (url: URL, path: String) -> URL {
    return url.appendingPathComponent(path)
}

fileprivate func + (defaults: Parameters, custom: Parameters) -> Parameters {
    return defaults.merging(custom, uniquingKeysWith: { _, new in new })
}

fileprivate func + (defaults: HTTPHeaders, custom: HTTPHeaders) -> HTTPHeaders {
    return defaults.merging(custom, uniquingKeysWith: { _, new in new })
}

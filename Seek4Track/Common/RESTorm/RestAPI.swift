//
//  API.swift
//  Seek4Track
//
//  Created by lyzkov on 05/02/2019.
//  Copyright © 2019 lyzkov. All rights reserved.
//

import Foundation
import Alamofire

protocol RestAPI {
    static var base: APIConfiguration { get }
}

struct APIConfiguration {
    let url: URL
    let parameters: Parameters
    let headers: HTTPHeaders

    init(url: URL, parameters: Parameters = [:], headers: HTTPHeaders = [:]) {
        self.url = url
        self.parameters = parameters
        self.headers = headers
    }
}

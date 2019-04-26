//
//  HTTPHeaders.swift
//  Seek4Track
//
//  Created by lyzkov on 15/03/2019.
//  Copyright © 2019 lyzkov. All rights reserved.
//

import Foundation

enum ContentType: String {
    case json = "application/json"
}

enum HTTPHeaderKey: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

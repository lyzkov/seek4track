//
//  Endpoint.swift
//  Seek4Track
//
//  Created by lyzkov on 12/03/2019.
//  Copyright © 2019 lyzkov. All rights reserved.
//

import Foundation
import Alamofire

protocol LastfmEndpoint: Endpoint { //where API == Lastfm {
}

extension LastfmEndpoint {

    var path: String {
        return ""
    }

}

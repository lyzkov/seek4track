//
//  Decode.swift
//  Seek4Track
//
//  Created by lyzkov on 05/02/2019.
//  Copyright © 2019 lyzkov. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

extension ObservableConvertibleType where E == Data {

    func decode<Model>() -> Observable<Model> where Model: Decodable {
        return asObservable()
            .map { data throws in
                try JSONDecoder().decode(Model.self, from: data)
            }
    }

}

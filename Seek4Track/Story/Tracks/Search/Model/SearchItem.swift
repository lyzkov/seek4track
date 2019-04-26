//
//  SearchItem.swift
//  Seek4Track
//
//  Created by lyzkov on 22/01/2019.
//  Copyright © 2019 lyzkov. All rights reserved.
//

import UIKit

struct SearchItem {
    let description: String
    let sourceIcon: UIImage
}

extension SearchItem {

    init(from track: Track) {
        self.init(description: "\(track.artist) - \(track.name)", sourceIcon: UIImage())
    }

}

//
//  SearchViewController.swift
//  Seek4Track
//
//  Created by lyzkov on 21/01/2019.
//  Copyright © 2019 lyzkov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        let tracks = Observable.just([
            "George Michael - Careless Whisper",
            "Celine Dion - All By Myself"
        ])

        tracks
            .bind(to: tableView.rx.items(
                cellIdentifier: R.reuseIdentifier.track.identifier,
                cellType: TrackTableViewCell.self)) { _, track, cell in
                cell.info.text = track
            }
            .disposed(by: disposeBag)
    }

}

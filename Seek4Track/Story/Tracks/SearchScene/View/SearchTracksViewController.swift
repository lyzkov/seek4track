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

final class SearchTracksViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let disposeBag = DisposeBag()

    private let cyclone = SearchTracksCyclone()

    override func viewDidLoad() {
        super.viewDidLoad()

        bind()
        cyclone.load.execute(())
    }

    private func bind() {
        cyclone.output[\.tracks]
            .bind(to: tableView.rx.items(
                cellIdentifier: R.reuseIdentifier.searchTrack.identifier,
                cellType: SearchTracksCell.self)) { _, track, cell in
                cell.trackDescription.text = track.description
            }
            .disposed(by: disposeBag)
    }

}

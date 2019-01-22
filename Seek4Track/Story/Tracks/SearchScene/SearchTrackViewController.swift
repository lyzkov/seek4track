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

final class SearchTrackViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        let tracks = Observable<[SearchTrackItem]>.just([
            .init(description: "George Michael - Careless Whisper", sourceIcon: UIImage()),
            .init(description: "Celine Dion - All By Myself", sourceIcon: UIImage()),
        ])

        tracks
            .bind(to: tableView.rx.items(
                cellIdentifier: R.reuseIdentifier.searchTrack.identifier,
                cellType: SearchTrackCell.self)) { _, track, cell in
                cell.trackDescription.text = track.description
            }
            .disposed(by: disposeBag)
    }

}

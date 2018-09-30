//
//  ViewController.swift
//  FlickrGallery
//
//  Created by Eric Yuan on 30/09/2018.
//  Copyright © 2018 Code Challenge. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class GalleryViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private let disposeBag = DisposeBag()

    private let viewModel = GalleryViewModel(flickrService: FlickrService(), schedulerProvider: SchedulerProvider())

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    func bindViewModel() {
        viewModel.photsDriver.drive(tableView.rx.items(cellIdentifier: PhotoViewCell.cellIdentifier, cellType: PhotoViewCell.self)) {(row, photo, cell) in
            cell.set(viewModel: photo)
        }.disposed(by: disposeBag)
    }
}


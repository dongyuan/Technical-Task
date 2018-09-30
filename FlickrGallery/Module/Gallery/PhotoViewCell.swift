//
//  PhotoViewCell.swift
//  FlickrGallery
//
//  Created by Eric Yuan on 30/09/2018.
//  Copyright © 2018 Code Challenge. All rights reserved.
//

import UIKit

final class PhotoViewCell: UITableViewCell {
    static let cellIdentifier = "photoViewCell"

    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateTakenLabel: UILabel!

    func set(viewModel: PhotoViewModel) {
        if let imageUrl = viewModel.imageUrl {
            photoImageView.from(url: imageUrl)
        } else {
            photoImageView.image = nil
        }

        titleLabel.text = viewModel.title
        dateTakenLabel.text = viewModel.dateTaken
    }
}

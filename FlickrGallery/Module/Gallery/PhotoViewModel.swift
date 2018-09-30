//
//  PhotoViewModel.swift
//  FlickrGallery
//
//  Created by Eric Yuan on 30/09/2018.
//  Copyright © 2018 Code Challenge. All rights reserved.
//

import Foundation

struct PhotoViewModel {
    let imageUrl: URL?
    let title: String
    let dateTaken: String

    init(photo: Photo, locale: Locale = Locale.current) {
        imageUrl = URL(string: photo.media.m)
        title = photo.title
        dateTaken = photo.dateTaken.formattedDate(locale: locale)
    }
}

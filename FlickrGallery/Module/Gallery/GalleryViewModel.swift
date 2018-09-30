//
//  GalleryViewModel.swift
//  FlickrGallery
//
//  Created by Eric Yuan on 30/09/2018.
//  Copyright © 2018 Code Challenge. All rights reserved.
//

import Foundation
import RxCocoa

struct GalleryViewModel {
    let photsDriver: Driver<[PhotoViewModel]>

    private let flickrService: FlickrServiceType

    init(flickrService: FlickrServiceType, schedulerProvider: SchedulerProtocol) {
        self.flickrService = flickrService

        // It's automatically switch to main thread using Driver of RxSwift
        // so we can make sure the network call occurs on background thread and return on main thread to
        // drive the UI components
        photsDriver = flickrService.fetchPublicPhotos()
            .subscribeOn(schedulerProvider.backgroundScheduler)
            .map{$0?.items ?? []}
            .map{$0.map{PhotoViewModel(photo: $0)}}
            .asDriver(onErrorJustReturn: [])
    }
}

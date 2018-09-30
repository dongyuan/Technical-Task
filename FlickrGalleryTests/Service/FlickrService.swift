//
//  FlickrService.swift
//  FlickrGalleryTests
//
//  Created by Eric Yuan on 30/09/2018.
//  Copyright © 2018 Code Challenge. All rights reserved.
//

import RxSwift
@testable import FlickrGallery

struct FlickrMockService: FlickrServiceType {
    private let response: Photos?
    private let error: Error?

    init(response: Photos?, error: Error? = nil) {
        self.response = response
        self.error = error
    }

    func fetchPublicPhotos() -> Observable<Photos?> {
        if let error = error {
            return .error(error)
        } else {
            return .just(response)
        }
    }
}

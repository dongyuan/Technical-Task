//
//  FlickrGalleryTests.swift
//  FlickrGalleryTests
//
//  Created by Eric Yuan on 30/09/2018.
//  Copyright © 2018 Code Challenge. All rights reserved.
//

import XCTest
import RxTest
@testable import FlickrGallery

class GalleryViewModelTests: XCTestCase {

    func testPhotosDriverWithInvalidResponseShowEmptyPhotoList() {
        // setup
        let flickrService = FlickrMockService(response: nil)
        let scheduler = TestScheduler(initialClock: 0)
        let viewModel = GalleryViewModel(flickrService: flickrService, schedulerProvider: TestSchedulerProvider(schedule: scheduler))

        let result = scheduler.record(source: viewModel.photsDriver.asObservable())

        // condition
        scheduler.start()

        // result
        XCTAssertEqual(result.events.first?.value.element?.count, 0)
    }

    func testPhotosDriverWithErrorShowEmptyPhotoList() {
        // setup
        let error = NSError(domain:"error", code:0, userInfo:nil)
        let flickrService = FlickrMockService(response: nil, error: error)
        let scheduler = TestScheduler(initialClock: 0)
        let viewModel = GalleryViewModel(flickrService: flickrService, schedulerProvider: TestSchedulerProvider(schedule: scheduler))

        let result = scheduler.record(source: viewModel.photsDriver.asObservable())

        // condition
        scheduler.start()

        // result
        XCTAssertEqual(result.events.first?.value.element?.count, 0)
    }

    func testPhotosDriverWithValidResponseEmptyPhotosShowEmptyPhotoList() {
        // setup
        let photos = mockedPhotosWithEmptyPhotos
        let flickrService = FlickrMockService(response: photos)
        let scheduler = TestScheduler(initialClock: 0)
        let viewModel = GalleryViewModel(flickrService: flickrService, schedulerProvider: TestSchedulerProvider(schedule: scheduler))

        let result = scheduler.record(source: viewModel.photsDriver.asObservable())

        // condition
        scheduler.start()

        // result
        XCTAssertEqual(result.events.first?.value.element?.count, 0)
    }

    func testPhotosDriverWithValidResponseShowPhotoList() {
        // setup
        let photos = mockedPhotosWithThreePhotos
        let flickrService = FlickrMockService(response: photos)
        let scheduler = TestScheduler(initialClock: 0)
        let viewModel = GalleryViewModel(flickrService: flickrService, schedulerProvider: TestSchedulerProvider(schedule: scheduler))

        let result = scheduler.record(source: viewModel.photsDriver.asObservable())

        // condition
        scheduler.start()

        // result
        XCTAssertEqual(result.events.first?.value.element?.count, 3)
    }
}

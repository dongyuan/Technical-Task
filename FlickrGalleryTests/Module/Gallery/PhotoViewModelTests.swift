//
//  File.swift
//  FlickrGalleryTests
//
//  Created by Eric Yuan on 30/09/2018.
//  Copyright © 2018 Code Challenge. All rights reserved.
//

import XCTest
import RxTest
@testable import FlickrGallery

class PhotoViewModelTests: XCTestCase {

    func testPhotoWithImageUrlShowImage() {
        // setup

        // condition
        let photo = photo1
        let viewModel = PhotoViewModel(photo: photo)
        let expectedUrl = URL(string: "https://farm2.staticflickr.com/1977/30075520567_2171448e71_m.jpg")

        // result
       XCTAssertEqual(viewModel.imageUrl, expectedUrl)
    }

    func testPhotoWithValidDateTakenShowLocalisedDateString() {
        // setup

        // condition
        let photo = photoWithFixedDateTakenDate
        let viewModel = PhotoViewModel(photo: photo, locale: Locale(identifier: "en_GB"))
        let expectedDateTaken = "30 Sep 2018 at 17:32:00"

        // result
        XCTAssertEqual(viewModel.dateTaken, expectedDateTaken)
    }

    func testPhotoWithValidTitleShowTitle() {
        // setup

        // condition
        let photo = photo1
        let viewModel = PhotoViewModel(photo: photo)
        let expectedTitle = "title1"

        // result
        XCTAssertEqual(viewModel.title, expectedTitle)
    }
}


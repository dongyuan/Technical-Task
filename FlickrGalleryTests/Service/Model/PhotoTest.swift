//
//  PhotoTest.swift
//  FlickrGalleryTests
//
//  Created by Eric Yuan on 30/09/2018.
//  Copyright © 2018 Code Challenge. All rights reserved.
//

import XCTest
@testable import FlickrGallery

final class PhotoTests: XCTestCase {

    func testPhotoParserWithInvalidDataReturnNil() {
        // setup

        // condition
        let responseData = "invalid response".data(using: .utf8)!

        // result
        XCTAssertNil(Photos.fromJson(responseData))
    }

    func testPhotoParserWithInvalidDateReturnNil() {
        // setup

        // condition
        let responseData = FileReader.jsonData("invalidPublicPhotos")!

        // result
        XCTAssertNil(Photos.fromJson(responseData))
    }

    func testPhotoParserWithDataReturnNil() {
        // setup

        // condition
        let responseData = FileReader.jsonData("validPublicPhotos")!

        // result
        XCTAssertEqual(Photos.fromJson(responseData)?.title, "Uploads from everyone")
        XCTAssertEqual(Photos.fromJson(responseData)?.items.count, 20)
    }
}

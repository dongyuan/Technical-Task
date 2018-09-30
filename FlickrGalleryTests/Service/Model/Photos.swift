//
//  Photos.swift
//  FlickrGalleryTests
//
//  Created by Eric Yuan on 30/09/2018.
//  Copyright © 2018 Code Challenge. All rights reserved.
//

import Foundation
@testable import FlickrGallery

let mockedPhotosWithEmptyPhotos = Photos(title: "title", link: "link", description: "", modified: Date(), generator: "", items: [])

let mockedPhotosWithThreePhotos = Photos(title: "title", link: "link", description: "", modified: Date(), generator: "", items: [photo1, photo2, photo3])

let photo1 = Photo(title: "title1", link: "https://www.flickr.com/photos/malcolmslaney/30075520567/", media: Media(m: "https://farm2.staticflickr.com/1977/30075520567_2171448e71_m.jpg"), dateTaken: Date(), description: "description1", published: Date(), author: "", authorId: "authorId", tags: "tags")

let photo2 = Photo(title: "title2", link: "https://www.flickr.com/photos/malcolmslaney/30075520567/", media: Media(m: "https://farm2.staticflickr.com/1977/30075520567_2171448e71_m.jpg"), dateTaken: Date(), description: "description1", published: Date(), author: "", authorId: "authorId", tags: "tags")

let photo3 = Photo(title: "title3",link: "https://www.flickr.com/photos/malcolmslaney/30075520567/", media: Media(m: "https://farm2.staticflickr.com/1977/30075520567_2171448e71_m.jpg"), dateTaken: Date(), description: "description1", published: Date(), author: "", authorId: "authorId", tags: "tags")

let photoWithFixedDateTakenDate = Photo(title: "invalid url", link: "invalidUrl", media: Media(m: "invalidUrl"), dateTaken: fixedDateTaken, description: "description1", published: Date(), author: "", authorId: "authorId", tags: "tags")

var fixedDateTaken: Date = {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    return dateFormatter.date(from: "2018-09-30T16:32:00Z")!
}()

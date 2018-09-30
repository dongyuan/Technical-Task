//
//  Photo.swift
//  FlickrGallery
//
//  Created by Eric Yuan on 30/09/2018.
//  Copyright © 2018 Code Challenge. All rights reserved.
//

import Foundation

struct Photos: Codable {
    let title: String
    let link: String
    let description: String
    let modified: Date
    let generator: String
    let items: [Photo]
}

extension Photos {
    static func fromJson(_ data: Data) -> Photos? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try? decoder.decode(self, from: data)
    }
}

struct Photo: Codable {
    let title: String
    let link: String
    let media: Media
    let dateTaken: Date
    let description: String
    let published: Date
    let author, authorId, tags: String

    enum CodingKeys: String, CodingKey {
        case title, link, media
        case dateTaken = "date_taken"
        case description, published, author
        case authorId = "author_id"
        case tags
    }
}

struct Media: Codable {
    let m: String
}

//
//  FlickrService.swift
//  FlickrGallery
//
//  Created by Eric Yuan on 30/09/2018.
//  Copyright © 2018 Code Challenge. All rights reserved.
//

import Foundation
import RxSwift

protocol FlickrServiceType {
    func fetchPublicPhotos() -> Observable<Photos?>
}

struct FlickrService: FlickrServiceType {
    func fetchPublicPhotos() -> Observable<Photos?> {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.flickr.com"
        urlComponents.path = "/services/feeds/photos_public.gne"
        urlComponents.query = "format=json&nojsoncallback=1"

        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session.rx.data(request: request).map{Photos.fromJson($0)}
    }
}

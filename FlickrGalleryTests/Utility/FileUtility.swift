//
//  FileUtility.swift
//  FlickrGalleryTests
//
//  Created by Eric Yuan on 30/09/2018.
//  Copyright © 2018 Code Challenge. All rights reserved.
//

import Foundation

final class FileReader {
    static func jsonData(_ filename: String) -> Data? {
        if let path = Bundle(for: self).url(forResource: filename, withExtension: "json") {
            return try? Data(contentsOf: path)
        }
        return nil
    }
}
